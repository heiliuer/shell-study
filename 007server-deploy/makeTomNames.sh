#!/bin/sh
#生成tomcat7服务器名称的后缀到当前目录对应的文件，方便使用tab提示服务器名称
tomcats_dir=/opt
tfile=/opt/deployshell
cd $tomcats_dir
ls|grep 'tomcat7_'|awk -v file="$tfile" -F cat7_ {'print file"/"$2'}|xargs touch