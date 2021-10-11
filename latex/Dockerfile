FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  git \
  build-essential \
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
  php7.0 \
	php-mysqli \
  python-pip

RUN apt-get update && apt-get install -y \
  texlive \
  texlive-xetex \
  texlive-fonts-extra \
  texlive-lang-all

RUN git clone https://github.com/espena/mkres.git && \
  cd mkres && \
  make install

RUN mkdir build && \
    cd build && \
    curl -L https://sourceforge.net/projects/ploticus/files/latest/download?source=files | tar xvz

COPY ploticus_makefile build/.

RUN cd build/ploticus*/src && \
    cp -f ../../ploticus_makefile Makefile && \
    make && \
    mv pl /usr/local/bin/. && \
    mkdir /opt/ploticus && \
    mv ../prefabs /opt/ploticus/.

RUN rm -rf build

RUN pip install wordcloud

ENV PLOTICUS_PREFABS=/opt/ploticus/prefabs

CMD tail -f /dev/null
