project=$1
action=$2
version=$3
if [ $version ];then
	modules/build.sh $sourceroot/$project/ $action $version
else
	modules/build.sh $sourceroot/$project/ $action	
fi

if [ $? -ne 0 ];then
	echo "build $project failed"
	exit 1
fi