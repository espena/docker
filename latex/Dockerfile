FROM ubuntu:latest

RUN mkdir build

COPY ploticus_makefile build/.

ENV PLOTICUS_PREFABS=/opt/ploticus/prefabs

RUN apt-get update && apt-get upgrade && apt-get install -y \
  git \
  build-essential \
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
  cd build && \
  curl -L https://sourceforge.net/projects/ploticus/files/latest/download?source=files | tar xvz && \
  cd build/ploticus*/src && \
  cp -f ../../ploticus_makefile Makefile && \
  make && \
  mv pl /usr/local/bin/. && \
  mkdir /opt/ploticus && \
  mv ../prefabs /opt/ploticus/. && \
  rm -rf build && \
  apt-get purge -y --auto-remove wget git gcc make build-essential

CMD tail -f /dev/null
