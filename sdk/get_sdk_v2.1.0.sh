#!/bin/sh

wget "https://github.com/espressif/ESP8266_NONOS_SDK/archive/v2.1.0.tar.gz"
wget "https://github.com/esp8266/esp8266-wiki/raw/master/include.tgz"

tar -xvzf v2.1.0.tar.gz
tar -xvzf include.tgz -C ESP8266_NONOS_SDK-2.1.0/

rm v2.1.0.tar.gz
rm include.tgz
