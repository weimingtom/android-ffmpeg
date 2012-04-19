#!/bin/sh

ANDROID_NDK_ROOT_PATH=/root/NecessitasQtSDK/android-ndk-r7c
ANDROID_API_VERSION=android-9
export PATH=${ANDROID_NDK_ROOT_PATH}:${ANDROID_NDK_ROOT_PATH}/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin/:$PATH

#armv7-a neon
./configure --target-os=linux --cross-prefix=arm-linux-androideabi- --arch=arm --cpu=armv7-a --sysroot=${ANDROID_NDK_ROOT_PATH}/platforms/${ANDROID_API_VERSION}/arch-arm --disable-avdevice --disable-decoder=h264_vdpau  --prefix=build/armeabi-v7a-neon --extra-cflags='-DANDROID -I${ANDROID_NDK_ROOT_PATH}/sources/cxx-stl/system/include -march=armv7-a -mfloat-abi=softfp -mfpu=neon' --extra-ldflags='-Wl,--fix-cortex-a8 -L../android-libs -Wl,-rpath-link,../android-libs' --extra-cxxflags='-Wno-multichar -fno-exceptions -fno-rtti'
make -j6 && make install && make distclean|| exit 0

#armv7-a
./configure --target-os=linux --cross-prefix=arm-linux-androideabi- --arch=arm --cpu=armv7-a --sysroot=${ANDROID_NDK_ROOT_PATH}/platforms/${ANDROID_API_VERSION}/arch-arm --disable-avdevice --disable-decoder=h264_vdpau  --prefix=build/armeabi-v7a --extra-cflags='-DANDROID -I${ANDROID_NDK_ROOT_PATH}/sources/cxx-stl/system/include -march=armv7-a -mfloat-abi=softfp' --extra-ldflags='-Wl,--fix-cortex-a8 -L../android-libs -Wl,-rpath-link,../android-libs' --extra-cxxflags='-Wno-multichar -fno-exceptions -fno-rtti'
make -j6 && make install && make distclean|| exit 0

#armv5te
./configure --target-os=linux --cross-prefix=arm-linux-androideabi- --arch=arm --cpu=armv5te --sysroot=${ANDROID_NDK_ROOT_PATH}/platforms/${ANDROID_API_VERSION}/arch-arm --disable-avdevice --disable-decoder=h264_vdpau  --prefix=build/armv5te --extra-cflags='-DANDROID -I${ANDROID_NDK_ROOT_PATH}/sources/cxx-stl/system/include -march=armv5te -msoft-float' --extra-ldflags='-Wl,--fix-cortex-a8 -L../android-libs -Wl,-rpath-link,../android-libs' --extra-cxxflags='-Wno-multichar -fno-exceptions -fno-rtti'
make -j6 && make install && make distclean|| exit 0
