#!/bin/bash

package="go1.4.src.tar.gz"
wget http://42.96.170.192/download/${package}
echo tar -C /usr/local -xzf ${package}
cd /usr/local/go/src && ./make.bash
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/bashrc
