FROM debian:stable
#RUN apk add --no-cache build-base git autoconf automake gperf bison flex texinfo bash gawk libtool ncurses-dev sed wget curl
RUN apt-get update -y; apt-get install -y git build-essential libncurses5-dev autoconf automake gperf bison flex texinfo gawk libtool-bin wget curl expat libexpat1-dev
VOLUME /build
RUN mkdir /espressif; chown nobody /espressif
USER nobody
WORKDIR /espressif
RUN git clone -b lx106 git://github.com/jcmvbkbc/crosstool-NG.git
WORKDIR /espressif/crosstool-NG
RUN ./bootstrap && ./configure --prefix=`pwd` && make && make install; ./ct-ng xtensa-lx106-elf; ./ct-ng build
