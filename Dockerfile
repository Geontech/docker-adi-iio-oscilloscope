# Use Ubuntu as Base Image
FROM ubuntu:16.04

# Add scripts to work directory
WORKDIR /app
ADD ./install_libiio.sh /app
ADD ./install_libad9361-iio.sh /app
ADD ./install_iio-oscilloscope.sh /app

# Update & Install dependencies
RUN apt-get -y update
RUN apt-get -y install bison flex cmake git xdg-utils \
  libxml2 libxml2-dev libcdk5-dev libaio-dev \
  libusb-1.0-0-dev libserialport-dev libavahi-client-dev \
  libavahi-common-dev libgtk2.0-dev libgtkdatabox-dev \
  libmatio-dev libfftw3-dev libcurl4-openssl-dev \
  libjansson-dev libcanberra-gtk-module packagekit-gtk3-module

# Install libiio
RUN ./install_libiio.sh
RUN ./install_libad9361-iio.sh
RUN ./install_iio-oscilloscope.sh

# Generate Machine ID for Display to Work
RUN dbus-uuidgen > /etc/machine-id

# Run Oscilloscope App
CMD osc
