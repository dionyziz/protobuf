#!/bin/bash
echo "Running autogen.sh..."
# minimal testcase for https://github.com/google/protobuf/issues/149
./autogen.sh
echo "Running ./configure --prefix=/usr"
./configure --prefix=/usr
echo "Running make"
make
echo "Running make check"
make check
echo "Running sudo make install"
sudo make install
