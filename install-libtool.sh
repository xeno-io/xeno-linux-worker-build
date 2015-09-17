#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Compute core count
CORE_COUNT=$(cat /proc/cpuinfo | grep processor | wc -l)


# Install upgraded libtool
wget -O libtool-2.4.6.tar.gz \
    http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.gz
tar xzf libtool-2.4.6.tar.gz
pushd libtool-2.4.6 > /dev/null
./configure
make -j$CORE_COUNT
make install
popd > /dev/null


# Clean up
rm -rf libtool-2.4.6
rm -f libtool-2.4.6.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
