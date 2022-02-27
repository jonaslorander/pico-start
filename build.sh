#!/bin/bash

PICO_SDK_PATH=/home/$USER/pico/pico-sdk/
PICO_EXAMPLES_PATH=/home/$USER/pico/pico-examples/
PICO_EXTRAS_PATH=/home/$USER/pico/pico-extras/

PICO_SDK_IMPORT=pico_sdk_import.cmake
CMAKELISTS=CMakeLists.txt

# Check for command line arguments
if [ $# -gt 0 ]; then
    # Check for "clean" argument
    if [ "$1" = "clean" ]; then
        # Remove old build files
        echo "Cleaning..."

        rm ./build -R

        echo "Cleanup complete."
        exit 0
    else
        echo "Invalid command line argument."
        exit 0
    fi
fi

# Check if pico SDK exists, otherwise exit
if [ -d "$PICO_SDK_PATH" ]; then
    # Copy pico_sdk_import.cmake if it doesn't exist
    if [ ! -f "./$PICO_SDK_IMPORT" ]; then
        cp "$PICO_SDK_PATH/external/$PICO_SDK_IMPORT" .
    fi
else
    echo "Aborting. Could not find directory $PICO_SDK_PATH"
    exit 0
fi

# Check for CMakeList.txt
if [ ! -f "$CMAKELISTS" ]; then
    echo "Aborting. No $CMAKELISTS file found."
    exit 0
fi

# All set, start building!
echo "Build starting."

# Create build dir if it does not exist
mkdir -p ./build
cd ./build

cmake \
    -DPICO_SDK_PATH=$PICO_SDK_PATH \
    -DPICO_PLATFORM=rp2040 \
    -DCMAKE_BUILD_TYPE=Release \
    ..

make -j4

cd ..
