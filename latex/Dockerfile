FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  texlive \
  texlive-fonts-extra \
  texlive-lang-all \
  pcregrep \
  mysql-client \
  vim \
  php7.0

RUN git clone https://github.com/espena/mkres.git && \
  cd mkres && \
  make install

CMD tail -f /dev/null
