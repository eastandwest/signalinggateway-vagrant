#!/usr/bin/env bash

## upgrade ubuntu
## also append additional repository to install gstreamer1.0
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

## install basement programs.
apt-get -y install curl git python-software-properties

## install gstreamer
add-apt-repository -y ppa:gstreamer-developers/ppa
apt-get update
apt-get -y install gstreamer1.0


