#!/usr/bin/env bash

# This helper script builds libzlog for different architectures and 
# installs the built packages locally to ensure the scion code will build correctly.

set -ex

mkdir -p /buildroot 
cd /buildroot 
git clone https://github.com/martin31821/scion.git
cd scion

debuild -us -uc -b -aamd64 -tc
debuild -us -uc -b -aarm64 -tc 
debuild -us -uc -b -aarmhf -tc 

cd /buildroot 
mkdir -p debs
for x in *.deb
do
	cp "${x}" debs
done
