name=$1
cd /opt/tomcat7_$name/bin/
./shutdown.sh
sleep 2s
./startup.sh


