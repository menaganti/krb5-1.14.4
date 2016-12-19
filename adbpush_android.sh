#!/bin/bash
#cd  "/home/buildUser/work/dge200/output/arm-linux"
adb shell remountFS.sh

adb push ./build/bin/kinit /system/bin/

#adb push ./build/lib/libapputils.a /system/lib/
#adb push ./build/lib/libcom_err.so /system/lib/
adb push ./build/lib/libcom_err.so.3 /system/lib/
#adb push ./build/lib/libcom_err.so.3.0 /system/lib/
#adb push ./build/lib/libgssapi_krb5.so /system/lib/
adb push ./build/lib/libgssapi_krb5.so.2 /system/lib/
#adb push ./build/lib/libgssapi_krb5.so.2.2 /system/lib/
#adb push ./build/lib/libgssrpc.so /system/lib/
adb push ./build/lib/libgssrpc.so.4 /system/lib/
#adb push ./build/lib/libgssrpc.so.4.2 /system/lib/
#adb push ./build/lib/libk5crypto.so /system/lib/
adb push ./build/lib/libk5crypto.so.3 /system/lib/
#adb push ./build/lib/libk5crypto.so.3.1 /system/lib/
#adb push ./build/lib/libkadm5clnt_mit.so /system/lib/
adb push ./build/lib/libkadm5clnt_mit.so.10 /system/lib/
#adb push ./build/lib/libkadm5clnt_mit.so.10.0 /system/lib/
#adb push ./build/lib/libkadm5srv_mit.so /system/lib/
adb push ./build/lib/libkadm5srv_mit.so.10 /system/lib/
#adb push ./build/lib/libkadm5srv_mit.so.10.0 /system/lib/
#adb push ./build/lib/libkdb5.so /system/lib/
adb push ./build/lib/libkdb5.so.8 /system/lib/
#adb push ./build/lib/libkdb5.so.8.0 /system/lib/
#adb push ./build/lib/libkrad.so /system/lib/
adb push ./build/lib/libkrad.so.0 /system/lib/
#adb push ./build/lib/libkrad.so.0.0 /system/lib/
#adb push ./build/lib/libkrb5.so /system/lib/
adb push ./build/lib/libkrb5.so.3 /system/lib/
#adb push ./build/lib/libkrb5.so.3.3 /system/lib/
#adb push ./build/lib/libkrb5support.so /system/lib/
adb push ./build/lib/libkrb5support.so.0 /system/lib/
#adb push ./build/lib/libkrb5support.so.0.1 /system/lib/
#adb push ./build/lib/libss.a /system/lib/
adb push ./build/lib/libverto.so /system/lib/
#adb push ./build/lib/libverto.so.0 /system/lib/
#adb push ./build/lib/libverto.so.0.0 /system/lib/
#adb push ./build/lib/rpc /system/lib/
#adb push ./build/lib/apputils /system/lib/
#adb push ./build/lib/crypto /system/lib/
#adb push ./build/lib/gssapi /system/lib/
#adb push ./build/lib/kadm5 /system/lib/
#adb push ./build/lib/kdb /system/lib/
