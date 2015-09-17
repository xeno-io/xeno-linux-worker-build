#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Install Python
wget -O Python-2.7.10.tar.gz \
    https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar xzf Python-2.7.10.tar.gz
pushd Python-2.7.10 > /dev/null
./configure
make
make install
popd > /dev/null


# Clean up
rm -rf Python-2.7.10
rm -f Python-2.7.10.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
