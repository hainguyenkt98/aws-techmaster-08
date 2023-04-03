#!/bin/bash

sudo apt-get update
sudo apt-get -y install git binutils
git clone https://github.com/aws/efs-utils
cd efs-utils
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb
cd ..
sudo mkdir share_data

sudo mount -t efs -o ro,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-07bfcf42ef2192dd8.efs.ap-southeast-1.amazonaws.com:/   ~/share_data