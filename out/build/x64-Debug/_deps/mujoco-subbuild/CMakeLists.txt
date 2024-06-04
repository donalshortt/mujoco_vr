# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.28.3-msvc11)

# Reject any attempt to use a toolchain file. We must not use one because
# we could be downloading it here. If the CMAKE_TOOLCHAIN_FILE environment
# variable is set, the cache variable will have been initialized from it.
unset(CMAKE_TOOLCHAIN_FILE CACHE)
unset(ENV{CMAKE_TOOLCHAIN_FILE})

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(mujoco-populate NONE)



include(ExternalProject)
ExternalProject_Add(mujoco-populate
                     "UPDATE_DISCONNECTED" "False" "DOWNLOAD_EXTRACT_TIMESTAMP" "TRUE" "EXTERNALPROJECT_INTERNAL_ARGUMENT_SEPARATOR" "URL_HASH" "SHA256=033f57add5d544a80a8d1b46ed115bd02ba62e4716c93dd62dd1a683627d3bbc" "URL" "https://github.com/google-deepmind/mujoco/releases/download/3.1.6/mujoco-3.1.6-windows-x86_64.zip"
                    SOURCE_DIR          "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/src/mujoco"
                    BINARY_DIR          "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/mujoco-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


