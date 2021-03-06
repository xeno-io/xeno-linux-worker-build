#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Compute core count
CORE_COUNT=$(cat /proc/cpuinfo | grep processor | wc -l)


# Install upgraded binutils
wget -O binutils-2.25.1.tar.gz \
    http://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.gz
tar xzf binutils-2.25.1.tar.gz
pushd binutils-2.25.1 > /dev/null
./configure
make -j$CORE_COUNT
make install
popd > /dev/null


# Clean up
rm -rf binutils-2.25.1
rm -f binutils-2.25.1.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
