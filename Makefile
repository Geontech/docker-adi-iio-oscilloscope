# Geon Technologies, LLC

M_DEPS += Dockerfile
M_DEPS += install_iio-oscilloscope.sh
M_DEPS += install_libad9361-iio.sh
M_DEPS += install_libiio.sh

.PHONY: run build clean

run: 
	docker run --rm -d \
		-e DISPLAY=$$DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		iio-osc 

build: $(M_DEPS)
	docker build -t iio-osc .

clean:
