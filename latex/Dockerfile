FROM ubuntu:latest

RUN mkdir ~/build

COPY ploticus_makefile /root/build/.

ENV PLOTICUS_PREFABS=/opt/ploticus/prefabs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  git \
  gcc \
  make \
  texlive \
  texlive-fonts-extra \
  texlive-lang-all \
  pcregrep \
  ploticus \
  mysql-client \
  vim \
  curl \
  imagemagick \
  libgd-dev \
  libjpeg-dev \
  libpng-dev \
  zlib1g-dev \
  libfreetype* \
  php7.2 \
	php7.2-mysql && \
  git clone https://github.com/espena/mkres.git && \
  cd mkres && \
  make install && \
  cd ~/build && \
  curl -L https://sourceforge.net/projects/ploticus/files/latest/download?source=files | tar xvz && \
  cd ~/build/ploticus*/src && \
  cp -f ~/build/ploticus_makefile Makefile && \
  make && \
  mv pl /usr/local/bin/. && \
  mkdir /opt/ploticus && \
  mv ../prefabs /opt/ploticus/. && \
  rm -rf ~/build && \
  apt-get purge -y --auto-remove curl git gcc make

CMD tail -f /dev/null
