# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Pull in Raspberry Pi Pico SDK (must be before project)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
#include($ENV{PICO_SDK_PATH}/external/pico_extras_import.cmake)

project(pico_helloworld C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

# add project files
add_executable(pico_helloworld pico_helloworld.c)

# pull in common dependencies
target_link_libraries(pico_helloworld pico_stdlib)

# enable usb output, disable uart output
pico_enable_stdio_usb(pico_helloworld 1)
pico_enable_stdio_uart(pico_helloworld 0)

# create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(pico_helloworld)