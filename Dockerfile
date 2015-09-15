# Start with a CentOS 5 base (this will default to the latest CentOS 5 release)
FROM centos:5

# Set the maintainer
MAINTAINER Jacob Howard <jacob@havoc.io>

# Update existing system packages
RUN yum -y update && yum clean all

# Install additional package groups
RUN yum -y groupinstall "Development Tools" "Development Libraries"

# Install additional packages
RUN yum -y install wget

# Do manual software installs
ADD install-dependencies.sh /usr/local/bin/install-dependencies.sh
RUN /usr/local/bin/install-dependencies.sh
