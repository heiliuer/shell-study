#!/bin/sh
#build dependency projects
export profile=`cat profile`
export sourceroot=/opt/secedu/starlink/
./mbuild.sh wxsdk install
./mbuild.sh share-lib install $profile
#build&deploy projects
./mbuild.sh pc-js package $profile
./mdeploy.sh pc-js /opt/tomcat7_starlink_pcjs/