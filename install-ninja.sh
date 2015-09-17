#!/bin/sh

# Move to the local source directory
pushd /usr/local/src > /dev/null


# Install Ninja
wget -O ninja-1.6.0.tar.gz \
    https://github.com/martine/ninja/archive/v1.6.0.tar.gz
tar xzf ninja-1.6.0.tar.gz
pushd ninja-1.6.0 > /dev/null
./configure.py --bootstrap
cp ninja /usr/local/bin/ninja
popd > /dev/null


# Clean up
rm -rf ninja-1.6.0
rm -f ninja-1.6.0.tar.gz


# Done with installations, move out of source directory
popd > /dev/null
