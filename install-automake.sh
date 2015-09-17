#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Install upgraded automake
wget -O automake-1.15.tar.gz \
    http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz
tar xzf automake-1.15.tar.gz
pushd automake-1.15 > /dev/null
./configure
make
make install
popd > /dev/null


# Clean up
rm -rf automake-1.15
rm -f automake-1.15.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
