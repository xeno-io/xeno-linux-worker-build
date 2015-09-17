#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Compute core count
CORE_COUNT=$(cat /proc/cpuinfo | grep processor | wc -l)


# Install Git
wget -O git-2.5.2.tar.gz \
    https://www.kernel.org/pub/software/scm/git/git-2.5.2.tar.gz
tar xzf git-2.5.2.tar.gz
pushd git-2.5.2 > /dev/null
./configure
make -j$CORE_COUNT
make install
popd > /dev/null


# Clean up
rm -rf git-2.5.2
rm -f git-2.5.2.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
