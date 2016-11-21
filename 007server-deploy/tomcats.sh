#!/bin/sh
#show running tomcats (pid,path)
#显示正在运行的tomcat进程
ps -ef|grep tomcat-juli.jar|awk '{print $2 $11}'