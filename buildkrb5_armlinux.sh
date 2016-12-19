#!/bin/bash

if [[ -z "${SVN_PATH}" || -z "${SVN_BRANCH_PATH}" ]]; then
    echo "SVN_PATH not set. source build_env.sh from the svn/trunk directory."
    exit -1
fi

#export CC=/opt/buildroot/output/host/usr/bin/arm-linux-gcc

export OUTPUT_DIRECTORY="/home/buildUser/work/dge200/output/arm-linux"

export BUILDROOT_OUTPUT="/opt/buildroot/output"
export ARM_SYSROOT="$BUILDROOT_OUTPUT/host/usr/arm-buildroot-linux-gnueabi/sysroot"

export PATH="$BUILDROOT_OUTPUT/host/usr/bin:$PATH"

export CPPFLAGS="--sysroot=$ARM_SYSROOT"
export CFLAGS="--sysroot=$ARM_SYSROOT"
export CXXFLAGS="--sysroot=$ARM_SYSROOT"

export LIBS="-L$BUILDROOT_OUTPUT/target/usr/lib -lcrypto -g -Wl,-Map=output.map"

BUILD_DIRECTORY=build_arm-linux
ifeq "$(wildcard $(BUILD_DIRECTORY) )" ""
  mkdir build_arm-linux
endif

cd $BUILD_DIRECTORY

echo "Start configure...."
../src/configure --prefix=${OUTPUT_DIRECTORY} --host=arm-linux --without-libedit --disable-thread-support

if [[ ! -d ${OUTPUT_DIRECTORY}/bin ]]; then
  if [[ ! -d "/home/buildUser/work/dge200/output" ]]; then
      mkdir /home/buildUser/work/dge200/output
  fi
  if [[ ! -d "/home/buildUser/work/dge200/output/arm-linux" ]]; then
      mkdir /home/buildUser/work/dge200/output/arm-linux
  fi
  mkdir ${OUTPUT_DIRECTORY}/bin
fi
if [[ ! -d ${OUTPUT_DIRECTORY}/lib ]]; then
  mkdir ${OUTPUT_DIRECTORY}/lib
fi

echo "Start build...."
make

echo "Start install....."
make install
cd ..

