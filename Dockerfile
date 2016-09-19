FROM ubuntu:14.04
MAINTAINER Nathan Cutler <ncutler@suse.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes install \
qemu-utils \
python-dev \
libssl-dev \
python-pip \
python-virtualenv \
libev-dev \
libvirt-dev \
libmysqlclient-dev \
libffi-dev \
libyaml-dev \
git

RUN adduser --disabled-password --gecos '' smithfarm
RUN echo "smithfarm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER smithfarm
WORKDIR /home/smithfarm

RUN git clone git://github.com/rjfd/teuthology.git --branch wip-opensuse-pr
WORKDIR teuthology
RUN ./bootstrap
RUN ./virtualenv/bin/pip install tox
RUN ./virtualenv/bin/tox -e py27
COPY bashrc /home/smithfarm/.bashrc
