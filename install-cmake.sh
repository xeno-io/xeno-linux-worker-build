#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Compute core count
CORE_COUNT=$(cat /proc/cpuinfo | grep processor | wc -l)


# Install CMake
wget -O cmake-3.3.1.tar.gz \
    http://www.cmake.org/files/v3.3/cmake-3.3.1.tar.gz
tar xzf cmake-3.3.1.tar.gz
pushd cmake-3.3.1 > /dev/null
# Need to use system cURL if we want SSL to work
./configure --system-curl
make -j$CORE_COUNT
make install
popd > /dev/null


# Clean up
rm -rf cmake-3.3.1
rm -f cmake-3.3.1.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
