FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    ncurses-dev \
    libssl-dev \
    binutils \
    wget \
    bzip2 \
    flex \
    python \
    perl \
    make \
    unzip \
    gawk \
    subversion \
    libz-dev \
    libc-dev \
    xz-utils \
    sudo \
    pkg-config \
    libevent-dev

RUN adduser --disabled-password --gecos "" dev && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    usermod -aG sudo dev && \
    mkdir -p /home/dev && \
    chown dev:dev /home/dev

USER dev

RUN cd /home/dev && \
    git clone https://github.com/openwrt/openwrt.git && \
    cd /home/dev/openwrt && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a

RUN cd /home/dev/openwrt && \
    make defconfig && \
    make V=s -j 5

RUN mkdir -p /home/dev/bin

COPY files/openwrt.conf /home/dev/bin/openwrt.conf

RUN cd ~ && \
    sudo chmod +x bin/openwrt.conf && \
    echo ". ~/bin/openwrt.conf" >> .bashrc

CMD cd ~ && tail -f /dev/null
