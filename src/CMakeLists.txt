cmake_minimum_required(VERSION 3.22.1)
set(PROJECT_NAME vr_mujoco)
project("${PROJECT_NAME}")

# Additional Directories for find_package() to search within.
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../cmake")

# For FetchContent_Declare() and FetchContent_MakeAvailable()
include(FetchContent)

# openxr_loader - From github.com/KhronosGroup
set(BUILD_TESTS
	OFF
	CACHE INTERNAL "Build tests"
)
set(BUILD_API_LAYERS
	ON
	CACHE INTERNAL "Use OpenXR layers"
)
FetchContent_Declare(
	OpenXR
	URL_HASH MD5=924a94a2da0b5ef8e82154c623d88644
	URL https://github.com/KhronosGroup/OpenXR-SDK-Source/archive/refs/tags/release-1.0.34.zip
	SOURCE_DIR
	openxr
)
FetchContent_MakeAvailable(OpenXR)

FetchContent_Declare(
	Mujoco
	URL_HASH SHA256=033f57add5d544a80a8d1b46ed115bd02ba62e4716c93dd62dd1a683627d3bbc
	URL https://github.com/google-deepmind/mujoco/releases/download/3.1.6/mujoco-3.1.6-windows-x86_64.zip
	SOURCE_DIR
	mujoco
)
FetchContent_MakeAvailable(Mujoco)

# Files
set(SOURCES
	"main.cpp"
	"../Common/GraphicsAPI.cpp"
	"../Common/GraphicsAPI_OpenGL.cpp"
	"../Common/OpenXRDebugUtils.cpp")
set(HEADERS
	"../Common/DebugOutput.h"
	"../Common/GraphicsAPI.h"
	"../Common/GraphicsAPI_OpenGL.h"
	"../Common/HelperFunctions.h"
	"../Common/OpenXRDebugUtils.h"
	"../Common/OpenXRHelper.h")

set(GLSL_SHADERS
	"../Shaders/VertexShader.glsl"
	"../Shaders/PixelShader.glsl")

add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

if(NOT "${XR_RUNTIME_JSON}" STREQUAL "")
	set_target_properties( ${PROJECT_NAME} PROPERTIES VS_DEBUGGER_ENVIRONMENT "XR_RUNTIME_JSON=${XR_RUNTIME_JSON}")
endif()

target_include_directories(${PROJECT_NAME} PRIVATE 
	# In this repo
	../Common/
	# From OpenXR repo
	"${openxr_SOURCE_DIR}/src/common"
	"${openxr_SOURCE_DIR}/external/include"

	# From Mujoco repo
	"${mujoco_SOURCE_DIR}/include"
)
target_link_libraries(
	${PROJECT_NAME} openxr_loader
	"${mujoco_SOURCE_DIR}/lib/mujoco.lib"
)

# Copy the MuJoCo DLL to the output directory
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    "${mujoco_SOURCE_DIR}/bin/mujoco.dll"
    $<TARGET_FILE_DIR:${PROJECT_NAME}>
)

# OpenGL
include(../cmake/gfxwrapper.cmake)
if(TARGET openxr-gfxwrapper)
	target_link_libraries(${PROJECT_NAME} openxr-gfxwrapper)
	target_compile_definitions(${PROJECT_NAME} PUBLIC XR_TUTORIAL_USE_OPENGL)
endif()

# OpenGL GLSL
set(SHADER_DEST "${CMAKE_CURRENT_BINARY_DIR}")
foreach(FILE ${GLSL_SHADERS})
    get_filename_component(FILE_WE ${FILE} NAME_WE)
    add_custom_command(
        OUTPUT "${SHADER_DEST}/${FILE_WE}.glsl"
        COMMAND 
            ${CMAKE_COMMAND} -E copy 
            "${CMAKE_CURRENT_SOURCE_DIR}/${FILE}"
            "${SHADER_DEST}/${FILE_WE}.glsl"
        COMMENT "GLSL ${FILE}"
        MAIN_DEPENDENCY "${FILE}"
        DEPEND "${FILE}"
        WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
        VERBATIM
    )
    # Make our project depend on these files
    target_sources(${PROJECT_NAME} PRIVATE "${SHADER_DEST}/${FILE_WE}.glsl")
endforeach(FILE)
