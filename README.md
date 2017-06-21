# Docker Analog Devices IIO Oscilloscope

This repository builds a Docker image for installing and running the Analog Devices IIO Oscilloscope within a Ubuntu 16.04 base image.

## Building

To build the image, run the `build.sh` script.

    $ ./build.sh

This script invokes the `Dockerfile` which installs the runtime dependencies before installing the following Analog Devices libraries:

 * [libiio](https://github.com/analogdevicesinc/libiio)
 * [libad9361-iio](https://github.com/analogdevicesinc/libad9361-iio)
 * [iio-oscilloscope](https://github.com/analogdevicesinc/iio-oscilloscope)

> **Note:** The `libiio` library is built with the serial backend interface turned off (`-DWITH_SERIAL_BACKEND=OFF`). This was a workaround to a failure to find the correct serial runtime libraries.

## Running

### Setting up the Target Device

Configure the network on the target device to be on the same network as the host operating system:

    $ ifconfig <nic> <ip_address> netmask <netmask>

Run the IIO daemon on the target device that is connected to the FMCOMMS3 board. Execute the following command:

    $ iiod

The shell should respond with the following message:

    Starting IIO Daemon version 0.9
    Registered to ZeroConf server avahi 0.6.32

### Launching the Docker Container

To launch the Docker container, run the `run.sh` script.

    $ ./run.sh

This script launches the `iio-osc` image and exports the display to the host operating system.

### Connecting the IIO Oscilloscope to the Target Device

To connect to the target device from the IIO Oscilloscope application, perform the following steps:

 * Enter the IP address of the target device in the `Remote Devices (network) Hostname` box
 * Click the `Refresh` button
 * If all goes well the `FRU Info`, `Context Info`, and `IIO Devices` boxes will be populated with data
 * Click the `OK` button

You are ready to start using the Analog Devices IIO Oscilloscope within a Docker container!