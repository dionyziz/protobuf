#!/bin/bash
sudo add-apt-repository ppa:kristinn-l/plaso-dev -y
sudo apt-get update -q
sudo apt-get install python-protobuf libprotoc-dev protobuf-compiler m2crypto python-support python-pandas libdistorm64-1 libdistorm64-dev python-psutil pytsk3

PLAT=amd64
DEB_DEPENDENCIES_URL=https://googledrive.com/host/0B1wsLqFoT7i2aW5mWXNDX1NtTnc/ubuntu-12.04-${PLAT}-debs.tar.gz
DEB_DEPENDENCIES_DIR=ubuntu-12.04-${PLAT}-debs
SLEUTHKIT_DEB=sleuthkit-lib_3.2.3-1_${PLAT}.deb

DEB_DEPENDENCIES_TARBALL=$(basename ${DEB_DEPENDENCIES_URL})
wget --no-verbose ${DEB_DEPENDENCIES_URL} -O ${DEB_DEPENDENCIES_TARBALL}
tar zxfv ${DEB_DEPENDENCIES_TARBALL}
sudo dpkg -i ${DEB_DEPENDENCIES_DIR}/${SLEUTHKIT_DEB} ${DEB_DEPENDENCIES_DIR}/${PYTSK_DEB}

echo "Running autogen.sh..."
# minimal testcase for https://github.com/google/protobuf/issues/149
./autogen.sh
echo "Running autogen.sh again..."
./autogen.sh
echo "Running ./configure --prefix=/usr"
./configure --prefix=/usr
echo "Running make"
make
echo "Running make check"
make check
echo "Running sudo make install"
sudo make install
