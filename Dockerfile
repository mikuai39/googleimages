FROM ubuntu:20.04
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y git curl wget && apt-get -y autoremove && apt-get -y clean && apt-get -y autoclean && mkdir -p /data/
RUN cd /data/ && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && export PATH=/data/depot_tools:"$PATH" && gclient sync && fetch v8
WORKDIR /data/
