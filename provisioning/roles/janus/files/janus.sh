#!/bin/bash
username=$1

# create working directory
mkdir ~/janus-install
cd ~/janus-install

# Install libsctp, for data channel
cd ~/janus-install
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=/usr; make; sudo make install

# Clone Janus-gateway and SkywayIoT plugin then attach plugin.
# Since tag v0.2.0 throw error while make process, we will not set any version.

cd ~/janus-install
git clone --branch v0.2.1 https://github.com/meetecho/janus-gateway.git
git clone --branch v0.4 https://github.com/eastandwest/janus-skywayiot-plugin.git
cd janus-skywayiot-plugin
bash addplugin.sh

# install
cd ../janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus --disable-mqtt --disable-rabbitmq --disable-docs --disable-websockets
make
sudo make install
sudo make configs
