#!/bin/bash

# install libraries which necessary for janus-gateway
# sudo aptitude install libmicrohttpd-dev libjansson-dev libnice-dev \
#   libssl-dev libsrtp-dev libsofia-sip-ua-dev libglib2.0-dev \
#   libopus-dev libogg-dev libini-config-dev libcollection-dev \
#   pkg-config gengetopt libtool automake cmake

# create working directory
mkdir ~/janus-install
cd ~/janus-install

# Install libscrtp for media channel manually, cause it was 1.4.x
cd ~/janus-install
wget https://github.com/cisco/libsrtp/archive/v1.5.0.tar.gz
tar xfv v1.5.0.tar.gz
cd libsrtp-1.5.0
./configure --prefix=/usr --enable-openssl
make libsrtp.so; sudo make install

# Install libsctp, for data channel
cd ~/janus-install
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr; make; sudo make install

