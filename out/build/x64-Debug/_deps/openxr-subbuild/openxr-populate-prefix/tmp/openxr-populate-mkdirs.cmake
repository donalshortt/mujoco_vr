# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/src/openxr"
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build"
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix"
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix/tmp"
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix/src/openxr-populate-stamp"
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix/src"
  "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix/src/openxr-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix/src/openxr-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-subbuild/openxr-populate-prefix/src/openxr-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
