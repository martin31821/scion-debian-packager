FROM ubuntu:16.04
LABEL Maintainer Martin Koppehel <mkoppehel@embedded.enterprises>


RUN dpkg --add-architecture i386 && dpkg --add-architecture armhf && dpkg --add-architecture arm64 && dpkg --add-architecture amd64
ADD apt.sources.list /etc/apt/sources.list
ADD apt.prefs /etc/apt/preferences.d/pcap.pref
RUN apt update && apt install -yq libpcap0.8:amd64 libpcap0.8:arm64 libpcap0.8:i386 libpcap0.8:armhf build-essential gcc gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf g++ g++-aarch64-linux-gnu g++-arm-linux-gnueabihf dpkg-dev golang-1.9-go capnproto bash linux-libc-dev:arm64 linux-libc-dev:armhf linux-libc-dev:amd64 linux-libc-dev:i386 git debhelper debianutils debootstrap dh-make gnupg2 libc6:arm64 libc6:armhf libc6:amd64 libc6:i386 devscripts build-essential lintian uthash-dev:armhf uthash-dev:arm64 uthash-dev:amd64 uthash-dev:i386 libpcap0.8-dev:amd64 libpcap0.8-dev:arm64 libpcap0.8-dev:armhf libpcap0.8-dev:i386

ADD zlog.sh /bin/zlog.sh
RUN chmod +x /bin/zlog.sh && /bin/zlog.sh

ADD scion.sh /bin/scion.sh
RUN chmod +x /bin/scion.sh
