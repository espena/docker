FROM ubuntu:15.04

RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  texlive \
  texlive-fonts-extra \
  texlive-lang-norwegian \
  texlive-lang-danish \
  texlive-lang-swedish \
  texlive-lang-german \
  texlive-lang-french \
  texlive-lang-spanish \
  texlive-lang-italian \
  pcregrep \
  mysql-client

RUN git clone https://github.com/espena/mkres.git && \
  cd mkres && \
  make install

CMD tail -f /dev/null
