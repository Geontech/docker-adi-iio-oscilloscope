#
#!/bin/bash
#
docker run --rm -d \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	iio-osc