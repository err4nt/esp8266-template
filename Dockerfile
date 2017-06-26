FROM debian:stable
RUN apt-get update -y; apt-get install -y git build-essential libncurses5-dev autoconf automake gperf bison flex texinfo gawk libtool-bin wget curl expat libexpat1-dev python-pip sudo
RUN useradd -s /bin/bash -m esp8266 && \
            echo "esp8266 ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/esp8266 && \
			chmod 0440 /etc/sudoers.d/esp8266
VOLUME /build
RUN mkdir /espressif; chown -R esp8266:esp8266 /espressif; pip install esptool
USER esp8266
WORKDIR /espressif
RUN git clone -b lx106 git://github.com/jcmvbkbc/crosstool-NG.git
WORKDIR /espressif/crosstool-NG
RUN ./bootstrap && ./configure --prefix=`pwd` && make && make install; ./ct-ng xtensa-lx106-elf; ./ct-ng build
