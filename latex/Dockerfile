FROM ubuntu:15.04

RUN apt-get update && apt-get install -y \
  git \
  build-essential \ 
  texlive \
  texlive-fonts-extra \
  texlive-lang-norwegian \
  pcregrep \
  mysql-client

RUN git clone https://github.com/espena/mkres.git && \
  cd mkres && \
  make install

CMD tail -f /dev/null
