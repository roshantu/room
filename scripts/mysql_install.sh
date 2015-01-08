#!/bin/sh

package="mysql-5.6.22.tar.gz"
if [ `id -u` -ne 0 ];then
    echo "run the scripts as root"
    exit 1
fi

if_error_exit()
{
    local ret=$?
    if [ $ret -ne 0 ];then
        echo "[error]:$@"
        exit $ret
    fi  
}

#install tools
yum -y install make gcc-c++ cmake bison-devel  ncurses-devel
if_error_exit "install ${package} enviroment"

if [ ! -f "${package}" ];then
    wget http://cdn.mysql.com/Downloads/MySQL-5.6/${package}
    if_error_exit "download ${package}"
fi

tar zxvf ${package}
if_error_exit "unpackage ${package}"

mysql_dir=`basename ${package} .tar.gz`
cd ${mysql_dir} && cmake \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
-DMYSQL_DATADIR=/usr/local/mysql/data \
-DSYSCONFDIR=/etc \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_READLINE=1 \
-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock \
-DMYSQL_TCP_PORT=3306 \
-DENABLED_LOCAL_INFILE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DEXTRA_CHARSETS=all \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci && make && make install
if_error_exit "install ${package}"

useradd mysql
chown mysql:mysql -R /usr/local/mysql
mkdir -p /var/lib/mysql
chown mysql:mysql -R /var/lib/mysql
mkdir -p /var/run/mysqld/
chown mysql:mysql /var/run/mysqld/ -R

echo 'export PATH=$PATH:/usr/local/mysql/bin/' >> /etc/bashrc 
