# Install script for directory: C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/src/openxr/src/api_layers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/Tech Labs/work/mujoco_vr/out/install/x64-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Layers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/api_layers" TYPE FILE FILES "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build/src/api_layers/XrApiLayer_api_dump.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Layers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/api_layers" TYPE MODULE FILES "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build/src/api_layers/XrApiLayer_api_dump.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Layers" OR NOT CMAKE_INSTALL_COMPONENT)
  include("C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build/src/api_layers/CMakeFiles/XrApiLayer_api_dump.dir/install-cxx-module-bmi-Debug.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Layers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/api_layers" TYPE FILE FILES "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build/src/api_layers/XrApiLayer_core_validation.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Layers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/api_layers" TYPE MODULE FILES "C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build/src/api_layers/XrApiLayer_core_validation.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Layers" OR NOT CMAKE_INSTALL_COMPONENT)
  include("C:/Users/Tech Labs/work/mujoco_vr/out/build/x64-Debug/_deps/openxr-build/src/api_layers/CMakeFiles/XrApiLayer_core_validation.dir/install-cxx-module-bmi-Debug.cmake" OPTIONAL)
endif()

