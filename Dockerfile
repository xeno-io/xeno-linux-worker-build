# Start with a CentOS 5 base (this will default to the latest x86_64 CentOS 5
# release)
FROM centos:5

# Set the maintainer
MAINTAINER Jacob Howard <jacob@havoc.io>

# Update existing system packages
RUN yum -y update && yum clean all

# Install additional package groups
RUN yum -y groupinstall "Development Tools" "Development Libraries"

# Install additional packages
RUN yum -y install wget

# Install Git
ADD install-git.sh /usr/local/bin/install-git.sh
RUN /usr/local/bin/install-git.sh

# Install Python
ADD install-python.sh /usr/local/bin/install-python.sh
RUN /usr/local/bin/install-python.sh

# Install Ninja
ADD install-ninja.sh /usr/local/bin/install-ninja.sh
RUN /usr/local/bin/install-ninja.sh

# Install CMake
ADD install-cmake.sh /usr/local/bin/install-cmake.sh
RUN /usr/local/bin/install-cmake.sh

# Install binutils
ADD install-binutils.sh /usr/local/bin/install-binutils.sh
RUN /usr/local/bin/install-binutils.sh

# Install autoconf
ADD install-autoconf.sh /usr/local/bin/install-autoconf.sh
RUN /usr/local/bin/install-autoconf.sh

# Install automake
ADD install-automake.sh /usr/local/bin/install-automake.sh
RUN /usr/local/bin/install-automake.sh

# Install libtool
ADD install-libtool.sh /usr/local/bin/install-libtool.sh
RUN /usr/local/bin/install-libtool.sh

# Install GCC
ADD install-gcc.sh /usr/local/bin/install-gcc.sh
RUN /usr/local/bin/install-gcc.sh
