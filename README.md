# scion-debian docker build process

This repository contains a fully automated build process using docker
to create debian packages for scion.

The usage is trivial:
- clone this repository, cd into the cloned folder
- run `docker build . -t scion-packager`
- run `docker run -it scion-packager:latest bash`
- within the container, execute `/bin/scion.sh`
- grab a coffee, the build takes around 15 minutes.
- Your debian packages reside in `/buildroot/debs`
- Done :)


