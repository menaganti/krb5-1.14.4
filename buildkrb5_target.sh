#!/bin/bash

if [[ -z "${SVN_PATH}" || -z "${SVN_BRANCH_PATH}" ]]; then
    echo "SVN_PATH not set. source build_env.sh from the svn/trunk directory."
    exit -1
fi

#export BIONIC_INCLUDE="${ANDROID_PARENT}/src/bionic/libc/private"
export OUTPUT_DIRECTORY="/home/buildUser/work/output/android"
export OPENSSL_INCLUDE="/home/buildUser/Android_omap_jb/trunk/customFiles/src/external/openssl/include"
export PATH="$PATH:${ANDROID_PARENT}/src/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6/bin"
export HOST_SYSROOT="${ANDROID_PARENT}/src/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.7-4.6/sysroot"
export ANDROID_SYSROOT="${ANDROID_PARENT}/src/prebuilts/ndk/8/platforms/android-14/arch-arm"

export CPPFLAGS="--sysroot=$ANDROID_SYSROOT -I$OPENSSL_INCLUDE"
export CFLAGS="--sysroot=$ANDROID_SYSROOT -I$OPENSSL_INCLUDE"
export CXXFLAGS="--sysroot=$ANDROID_SYSROOT -I$OPENSSL_INCLUDE"

export LDFLAGS="-L${ANDROID_PARENT}/src/out/target/product/panda5/system/lib -Wl,-Map=output.map"
export LIBS="-lcrypto -lssl"

echo $PATH
echo $ANDROID_SYSROOT
echo $CPPFLAGS
echo $CFLAGS
echo $CXXFLAGS


if [[ ! -d ${OUTPUT_DIRECTORY}/bin ]]; then
  if [[ ! -d "/home/buildUser/work" ]]; then
      mkdir /home/buildUser/work
  fi
  if [[ ! -d "/home/buildUser/work/output" ]]; then
      mkdir /home/buildUser/work/output
  fi
  if [[ ! -d "/home/buildUser/work/output/android" ]]; then
      mkdir /home/buildUser/work/output/android
  fi
  mkdir ${OUTPUT_DIRECTORY}/bin
fi
if [[ ! -d ${OUTPUT_DIRECTORY}/lib ]]; then
  mkdir ${OUTPUT_DIRECTORY}/lib
fi


export BUILD_DIRECTORY=build_android
ifeq "$(wildcard $(BUILD_DIRECTORY) )" ""
  mkdir build_android
endif

cd build_android

../src/configure --prefix=${OUTPUT_DIRECTORY} --host=arm-linux-androideabi --build=x86_64-unknown-linux-gnu --disable-thread-support

## Adjust autoconf.h's definitions
#target=Android
#if [[ $target == 'Android' ]]; then
#    sed -i 's/#define KRB5_DNS_LOOKUP 1/#undef KRB5_DNS_LOOKUP/g' include/autoconf.h
#fi

##  Skip building the parts we don't need. After running ./configure, if a 
##  folder is renamed or deleted, it will be skipped during the build process.
if [ -d "./appl" ]; then
    rm -rf ./appl.exclude
    mv ./appl ./appl.exclude
    echo "Renamed ./appl to ./appl.exclude"
fi
if [ -d "./tests" ]; then
    rm -rf ./tests.exclude
    mv ./tests ./tests.exclude
    echo "Renamed ./tests to ./tests.exclude"
fi
if [ -d "./kadmin" ]; then
    rm -rf ./kadmin.exclude
    mv ./kadmin ./kadmin.exclude
    echo "Renamed ./kadmin to ./kadmin.exclude"
fi

cp ../autoconf.h ./include/autoconf.h
#Compile
make

cd ..
#install
