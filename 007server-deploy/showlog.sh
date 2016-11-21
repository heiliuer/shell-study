name=$1
type=$2
if [ "$name"x = "help"x ]; then
	echo 默认查看catalina.out日志
	echo -a 查看access日志
	echo -l 查看localhost日志
	exit
fi
cd /opt/tomcat7_$name/logs/
logfile=catalina.out
if [ "$type"x = "-a"x ]; then
	logfile=`ls|grep access|tail -1`
fi
if [ "$type"x = "-l"x ]; then
	logfile=`ls|grep "localhost\."|tail -1`
fi
echo showlog $logfile
tail -f -n 200 $logfile