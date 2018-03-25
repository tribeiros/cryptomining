#!/bin/bash

sudo apt-get update && sudo apt -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev git &&
git clone https://github.com/fireice-uk/xmr-stak-cpu.git &&
cd xmr-stak-cpu/ &&
cmake . && 
make install && 
sudo sysctl -w vm.nr_hugepages=128 &&
sudo chmod 0777 /etc/security/limits.conf &&
sudo echo -e "* soft memlock 262144\n* hard memlock 262144\n" >> /etc/security/limits.conf &&
cp ~/config.txt ~/xmr-stak-cpu/bin/ &&
cd bin/
./xmr-stak-cpu
