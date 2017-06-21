#
#!/bin/bash
#
git clone https://github.com/analogdevicesinc/libiio.git
cd ./libiio
cmake -DWITH_SERIAL_BACKEND=OFF ./
make all
make install
PATH=/usr/lib/:$PATH