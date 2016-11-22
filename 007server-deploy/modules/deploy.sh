#!/bin/sh
#export M2_HOME=/usr/local/apache-maven-3.1.1
#export PATH=$PATH:$M2_HOME/bin
tomcat=$1
source=$2

if [ ! $tomcat ] && [ ! -f $tomcat ]; then
	echo "ERROR: tomcat $tomcat is empty or not exist"
	exit 1
fi

if [ ! $source ] && [ ! -f $source ]; then
	echo "ERROR: source $source is empty or not exist"
	exit 1
fi

echo ""
echo "******************************"
echo "***************building $source"
echo "******************************"
cd $source
#define targetfile
targetfile=$source/target/`ls -F target|grep -v .war|grep -v classes|grep -v ources|grep -v archiver`

#shut tomcat
echo ""
echo "******************************"
echo "***************tomcatshut $tomcat"
echo "******************************"
$tomcat/bin/shutdown.sh

#copy target to ROOT
echo ""
echo "******************************"
echo "***************copy target to ROOT"
echo "******************************"


rm -rf $tomcat/webapps/*
mkdir -p $tomcat/webapps/ROOT/
cp -rf $targetfile/* $tomcat/webapps/ROOT/


#mark deploy time
deploy_info_file=$tomcat/webapps/ROOT/deploy_info
{ echo "##svnInfo:";svn info $source;echo "";echo "##deployTime:";echo "$(date '+%Y-%m-%d %H:%M:%S')"; } > $deploy_info_file

#start tomcat
echo ""
echo "******************************"
echo "***************tomcatstart $tomcat"
echo "******************************"
$tomcat/bin/startup.sh
