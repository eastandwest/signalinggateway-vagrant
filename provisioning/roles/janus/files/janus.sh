#!/bin/bash
username=$1

# create working directory
mkdir ~/janus-install
cd ~/janus-install

# Install libscrtp for media channel manually, cause it was 1.4.x
cd ~/janus-install
wget https://github.com/cisco/libsrtp/archive/v1.5.0.tar.gz
tar xfv v1.5.0.tar.gz
cd libsrtp-1.5.0
./configure --prefix=/usr --enable-openssl
make libsrtp.so; sudo make uninstall; sudo make install

# Install libsctp, for data channel
cd ~/janus-install
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr; make; sudo make install

# Clone SkywayIoT plugin and apply on janus-gateway
cd ~/janus-install
git clone --branch v0.4 https://github.com/eastandwest/janus-skywayiot-plugin.git

# Install janus-gateway
cd ~/janus-install
git clone https://github.com/meetecho/janus-gateway.git
cd janus-skywayiot-plugin
bash addplugin.sh
cd ../janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus --disable-mqtt --disable-rabbitmq --disable-docs --disable-websockets --disable-mqtt
make
sudo make install
sudo make configs