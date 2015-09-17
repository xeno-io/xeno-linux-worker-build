#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Install upgraded autoconf
wget -O autoconf-2.69.tar.gz \
    http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar xzf autoconf-2.69.tar.gz
pushd autoconf-2.69 > /dev/null
./configure
make
make install
popd > /dev/null


# Clean up
rm -rf autoconf-2.69
rm -f autoconf-2.69.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
