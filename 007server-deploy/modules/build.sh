#!/bin/sh
#export M2_HOME=/usr/local/apache-maven-3.1.1
#export PATH=$PATH:$M2_HOME/bin
svnrepo=$1
mavenaction=$2
version=$3

if [ ! $svnrepo ] && [ ! -f $svnrepo ]; then
	echo "ERROR: svnrepo $svnrepo is empty or not exist"
	exit 1
fi
echo "build $svnrepo"

if [ ! $mavenaction ];then
	mavenaction=package
fi

cmd="mvn clean "$mavenaction
if [ $version ];then
	cmd=$cmd" -P "$version
fi

echo ""
echo "******************************"
echo "***************building $svnrepo"
echo "******************************"
#clear unversion files
cd $svnrepo
svn st|grep '^?'|awk '{print $2}'|xargs rm -rf
svn up
#build
echo "cmd $cmd"
$cmd -Dmaven.test.skip=true
if [ ! -f target/*.war ]&&[ ! -f target/*.jar ]; then
	echo "ERROR: build $svnrepo err!"
	exit 1
fi
