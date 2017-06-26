CONTAINER = esp8266

all:
	docker run --rm -v `pwd`:/build $(CONTAINER) /bin/bash -c "source /build/env; cd /build/firmware; make"

clean:
	docker run --rm -v `pwd`:/build $(CONTAINER) /bin/bash -c "source /build/env; cd /build/firmware; make clean"

prepare:
	docker build -t esp8266 . 
