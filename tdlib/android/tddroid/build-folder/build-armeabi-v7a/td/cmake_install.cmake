# Install script for directory: /home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "MinSizeRel")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtdjson.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtdjson.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtdjson.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/libtdjson.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtdjson.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtdjson.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/hexaminate/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtdjson.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/libtdjson_static.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/libtdjson_private.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/libtdclient.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/libtdcore.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/libtdapi.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdutils.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdactor.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdnet.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdsqlite.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tddb.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdcore.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdclient.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdapi.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdjson_private.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdjson.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/pkgconfig/tdjson_static.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Td/TdTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Td/TdTargets.cmake"
         "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/CMakeFiles/Export/lib/cmake/Td/TdTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Td/TdTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Td/TdTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Td" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/CMakeFiles/Export/lib/cmake/Td/TdTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Td" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/CMakeFiles/Export/lib/cmake/Td/TdTargets-minsizerel.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/td/telegram" TYPE FILE FILES
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/telegram/td_json_client.h"
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/telegram/td_log.h"
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/td/telegram/tdjson_export.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/td/telegram" TYPE FILE FILES
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/telegram/Client.h"
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/telegram/Log.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/td/tl" TYPE FILE FILES "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/tl/TlObject.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/td/telegram" TYPE FILE FILES
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/generate/auto/td/telegram/td_api.h"
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/td/generate/auto/td/telegram/td_api.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Td" TYPE FILE FILES
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/tdlib-src/TdConfig.cmake"
    "/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/TdConfigVersion.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/tdtl/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/tdutils/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/td/generate/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/tdactor/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/tdnet/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/sqlite/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/tddb/cmake_install.cmake")
  include("/home/hexaminate/Documents/HEXAMINATE/library/telegram_client/tdlib/android/tddroid/build-folder/build-armeabi-v7a/td/test/cmake_install.cmake")

endif()

