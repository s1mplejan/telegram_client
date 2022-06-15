#!/bin/sh

mkdir -p build_native
cd build_native
cmake .. || exit 1
cmake --build . --target prepare_cross_compiling || exit 1
cd ..

ANDROID_SDK_ROOT="/home/hexaminate/Android/Sdk/ndk/24.0.8215888" ABI="x86" ./build.sh || exit 1
ANDROID_SDK_ROOT="/home/hexaminate/Android/Sdk/ndk/24.0.8215888" ABI="x86_64" ./build.sh || exit 1
ANDROID_SDK_ROOT="/home/hexaminate/Android/Sdk/ndk/24.0.8215888" ABI="armeabi-v7a" ./build.sh || exit 1
ANDROID_SDK_ROOT="/home/hexaminate/Android/Sdk/ndk/24.0.8215888" ABI="arm64-v8a" ./build.sh || exit 1


echo "Building Completed!"
