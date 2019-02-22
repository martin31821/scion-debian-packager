#!/usr/bin/env bash

set -ex

mkdir /buildroot 
cd /buildroot 
git clone https://github.com/martin31821/zlog.git
cd zlog 
git checkout 1.2.12/debian 
debuild -us -uc -b -aamd64 -tc 
debuild -us -uc -b -aarm64 -tc 
debuild -us -uc -b -aarmhf -tc 
cd /buildroot 
for x in *.deb
do 
	dpkg -I "${x}"
done
