#!/bin/bash

start_hiveserver() {
	if ! [ -f /etc/hadoop/conf/.init.hiveserver  ] 
	then
		hadoop fs -mkdir -p    /tmp && \
		hadoop fs -mkdir -p    /user/hive/warehouse &&  \
		hadoop fs -chmod g+w   /tmp && \
		hadoop fs -chmod g+w   /user/hive/warehouse && \
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
		echo "Only { hiverserver2 | metastore } are valid!"
		;;
esac
