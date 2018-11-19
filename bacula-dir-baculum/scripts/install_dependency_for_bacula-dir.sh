#!/bin/bash

# if the rpm package is already installed ,skip
# else install it

apt_get_install(){

if [ `dpkg -l | grep $1 |wc -l` -ne 0 ]

then
	echo $1 already installed.
else
	echo -e "\033[32m ************************Install $1  ........... \033[0m"
	apt-get install -y $1
	check_ok
fi


}

check_ok(){
if [ $? -ne 0 ]
then
	echo -e  "\033[31m "Erro,Check the error log."   \033[0m"
fi
}

#################################################
#  Example 1                                    #
#install rpm package gcc gcc-c--- vim vi        #
#if it isnot installed,then it will be installed#
# you can replace the "gcc gcc-c-- vim vi" with #
# the rpm package name you want to install      #
#qt-config qt-devel qt-odbc qt-mysql            #
#qt-postgresql                                  # 
#################################################
requirements="vim make gcc build-essential perl unp mc mtx libreadline7 \
libreadline7-dbg libreadline-gplv2-dev zlib1g-dev lzop liblzo2-dev python-lzo sudo \
gawk gdb libacl1 libacl1-dev libssl-dev lsscsi apt-transport-https \
qt4-dev-tools qt4-qtconfig  libqt4-dev libqwt5-qt4 \
libqwt5-qt4-dev pkg-config wget"
for p in $requirements 
do apt_get_install $p
done
apt-get clean all

