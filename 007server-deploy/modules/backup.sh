#!/bin/sh
#export M2_HOME=/usr/local/apache-maven-3.1.1
#export PATH=$PATH:$M2_HOME/bin
tomcat=$1
if [ ! $tomcat ] && [ ! -f $tomcat ]; then
	echo "ERROR: tomcat $tomcat is empty or not exist"
	exit 1
fi
#backup ROOT
echo ""
echo "******************************"
echo "***************backup $tomcat ROOT"
echo "******************************"
#bakpath=$tomcat"/bak"$(date '+%Y%m%d%H%M%S')
bakpath=$tomcat"/bak"$(date '+%Y%m%d%H')/
echo backup $tomcat'webapps' to $bakpath
mkdir -p $bakpath/
rm -rf $bakpath/*
cp -rf $tomcat''webapps/* $bakpath
