#!/bin/bash

# if the rpm package is already installed ,skip
# else install it

yum_install(){

if [ `rpm -qa | grep $1 |wc -l` -ne 0 ]

then
	echo $1 already installed.
else
	echo -e "\033[32m ************************Install $1  ........... \033[0m"
	yum install -y $1
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
requirements="vim make gcc gcc-c++ openssl-devel perl  mc mtx readline-devel \
lzop lzo lzo-devel zlib-devel sudo gawk gdb libacl-devel lsscsi deltarpm wget qt \
mysql-community-devel mysql-community-server \
mysql-community-libs mysql-community-client "
for p in $requirements 
do yum_install $p
done
yum clean all

