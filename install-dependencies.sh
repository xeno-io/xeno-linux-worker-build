#!/bin/sh


# Move to the local source directory
pushd /usr/local/src > /dev/null


# Install Git
wget -O git-2.5.2.tar.gz \
    https://www.kernel.org/pub/software/scm/git/git-2.5.2.tar.gz
tar xzf git-2.5.2.tar.gz
pushd git-2.5.2 > /dev/null
./configure
make
make install
popd > /dev/null


# Install Python
wget -O Python-2.7.10.tar.gz \
    https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar xzf Python-2.7.10.tar.gz
pushd Python-2.7.10 > /dev/null
./configure
make
make install
popd > /dev/null


# Install Ninja
wget -O ninja-1.6.0.tar.gz \
    https://github.com/martine/ninja/archive/v1.6.0.tar.gz
tar xzf ninja-1.6.0.tar.gz
pushd ninja-1.6.0 > /dev/null
./configure.py --bootstrap
cp ninja /usr/local/bin/ninja
popd > /dev/null


# Install CMake
wget -O cmake-3.3.1.tar.gz \
    http://www.cmake.org/files/v3.3/cmake-3.3.1.tar.gz
tar xzf cmake-3.3.1.tar.gz
pushd cmake-3.3.1 > /dev/null
# Need to use system cURL if we want SSL to work
./configure --system-curl
make
make install
popd


# Install upgraded binutils
wget -O binutils-2.25.1.tar.gz \
    http://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.gz
tar xzf binutils-2.25.1.tar.gz
pushd binutils-2.25.1 > /dev/null
./configure
make
make install
popd > /dev/null


# Install upgraded autoconf
wget -O autoconf-2.69.tar.gz \
    http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar xzf autoconf-2.69.tar.gz
pushd autoconf-2.69
./configure
make
make install
popd > /dev/null


# Install upgraded automake
wget -O automake-1.15.tar.gz \
    http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz
tar xzf automake-1.15.tar.gz
pushd automake-1.15 > /dev/null
./configure
make
make install
popd > /dev/null


# Install upgraded libtool
wget -O libtool-2.4.6.tar.gz \
    http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.gz
tar xzf libtool-2.4.6.tar.gz
pushd libtool-2.4.6 > /dev/null
./configure
make
make install
popd > /dev/null


# Done with installations, move out of source directory
popd > /dev/null
