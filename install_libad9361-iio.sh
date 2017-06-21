#
#!/bin/bash
#
git clone https://github.com/analogdevicesinc/libad9361-iio.git
cd ./libad9361-iio
cmake ./
make
make install