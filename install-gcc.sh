#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Install GCC
# NOTE: GCC requires an out-of-tree build
wget -O gcc-5.2.0.tar.gz \
    http://ftp.gnu.org/gnu/gcc/gcc-5.2.0/gcc-5.2.0.tar.gz
tar xzf gcc-5.2.0.tar.gz
pushd gcc-5.2.0 > /dev/null
contrib/download_prerequisites
popd > /dev/null
mkdir gcc-5.2.0-build
pushd gcc-5.2.0-build > /dev/null
../gcc-5.2.0/configure --enable-languages=c,c++
make
make install
popd > /dev/null


# Clean up
rm -rf gcc-5.2.0-build
rm -rf gcc-5.2.0
rm -f gcc-5.2.0.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
