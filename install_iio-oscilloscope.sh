#
#!/bin/bash
#
mkdir /usr/share/desktop-directories/
git clone https://github.com/analogdevicesinc/iio-oscilloscope.git
cd ./iio-oscilloscope
git checkout origin/master
make -j 4
make install