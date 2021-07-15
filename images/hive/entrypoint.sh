#!/bin/bash

start_hiveserver() {
	if ! [ -f /etc/hadoop/conf/.init.hiveserver  ] 
	then    
		hadoop fs -rm -f -r -skipTrash /tmp /user/hive && \
		hadoop fs -mkdir -p    /tmp && \
		hadoop fs -mkdir -p    /user/hive/warehouse &&  \
		hadoop fs -chmod 777   /tmp && \
		hadoop fs -chmod 777   /user/hive/warehouse && \
	        schematool -dbType mysql -initSchema && \	
		touch /etc/hadoop/conf/.init.hiveserver && \
		hiveserver2
	else
		hiveserver2
	fi
}

case $1 in
	hiveserver2)
		start_hiveserver
		;;
	*)
		#echo "Only { hiverserver2 | metastore } are valid!"
		$1
		;;
esac
