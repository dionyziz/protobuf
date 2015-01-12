#!/bin/bash
sudo add-apt-repository ppa:kristinn-l/plaso-dev -y
sudo apt-get update -q
sudo apt-get install python-protobuf libprotoc-dev protobuf-compiler m2crypto python-support python-pandas libdistorm64-1 libdistorm64-dev python-psutil pytsk3

git clone https://github.com/google/protobuf.git
cd protobuf
pwd
echo "Running autogen.sh..."
# minimal testcase for https://github.com/google/protobuf/issues/149
./autogen.sh
./autogen.sh
echo "Running ./configure --prefix=/usr"
./configure --prefix=/usr
echo "Running make"
make
echo "Running make check"
make check
echo "Running sudo make install"
sudo make install
