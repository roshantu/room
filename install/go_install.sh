#!/bin/bash

. ./base.sh

#check root run
check_root

package="go1.4.src.tar.gz"
if [ ! -f "${package}" ];then
    wget http://42.96.170.192/download/${package}
fi

tar -C /usr/local -xzf ${package}
if_error_exit "untar ${package}"

cd /usr/local/go/src && ./make.bash
if_error_exit "make install"

echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/bashrc
if_error_exit "add go in env"

source /etc/bashrc
