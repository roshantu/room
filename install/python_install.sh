#!/bin/bash

if [ `id -u` -ne 0 ];then
    echo "run the scripts as root, the scripts works in centos"
    exit 1
fi

yum groupinstall -y 'development tools'
yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel
CWD=`dirname "${0}"` || exit 1
if [ ! -f "$CWD/Python-2.7.6.tar.xz" ];then
    wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz
fi

yum install xz-libs
xz -d Python-2.7.6.tar.xz
tar -xvf Python-2.7.6.tar
cd Python-2.7.6 && ./configure --prefix=/usr/local && make && make altinstall


cd "$CWD"
if [ ! -f "$CWD/setuptools-1.4.2.tar.gz" ];then
    wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
fi
tar -xvf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
python2.7 setup.py install
wget https://bootstrap.pypa.io/get-pip.py
python2.7 get-pip.py

#pip install
pip install virtualenv




