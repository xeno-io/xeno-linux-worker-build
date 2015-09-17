#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Compute core count
CORE_COUNT=$(cat /proc/cpuinfo | grep processor | wc -l)


# Install GCC
# NOTE: GCC requires an out-of-tree build
# NOTE: There was an issue where libsanitizer wouldn't build against 2.6.18
# kernels:
#   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59068
# This seems to be fixed in (at least) GCC 5.2+, though mention of the exact
# version that fixed it is fuzzy.  It worked in GCC 4.8 as well.  See also:
#   http://marc.info/?l=gcc-patches&m=138599938123614&w=2
wget -O gcc-5.2.0.tar.gz \
    http://ftp.gnu.org/gnu/gcc/gcc-5.2.0/gcc-5.2.0.tar.gz
tar xzf gcc-5.2.0.tar.gz
pushd gcc-5.2.0 > /dev/null
contrib/download_prerequisites
popd > /dev/null
mkdir gcc-5.2.0-build
pushd gcc-5.2.0-build > /dev/null
../gcc-5.2.0/configure --enable-languages=c,c++
make -j$CORE_COUNT
make install
popd > /dev/null


# Clean up
rm -rf gcc-5.2.0-build
rm -rf gcc-5.2.0
rm -f gcc-5.2.0.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
