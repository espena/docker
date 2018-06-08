FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  git \
  libmysqlclient-dev \
  tar \
  build-essential \
  wget

RUN git clone https://github.com/sphinxsearch/sphinx.git && \
    cd sphinx

RUN cd sphinx && \
    wget http://snowball.tartarus.org/dist/libstemmer_c.tgz && \
    mkdir _libstemmer && \
    tar xvf libstemmer_c.tgz -C _libstemmer && \
    cp -af _libstemmer/libstemmer_c/* libstemmer_c/. && \
    rm -rf _libstemmer

RUN cd sphinx/libstemmer_c && \
    make

RUN cd sphinx && \
    ./configure --with-libstemmer && \
    make clean && \
    make -j4 && \
    make -j4 install

CMD tail -f /dev/null
