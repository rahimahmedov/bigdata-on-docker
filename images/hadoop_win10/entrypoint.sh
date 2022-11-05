#!/bin/bash

start_hdfs_nn() {
	rm -f /tmp/hadoop-root-namenode.pid
	if ! [ -f /nn/current/VERSION ] 
	then
    		hdfs namenode -format -force
	fi
	hdfs namenode 
}

start_hdfs_snn() {
	rm -f /tmp/hadoop-root-secondarynamenode.pid
	hdfs secondarynamenode
}

start_hdfs_dn() {
	rm -f /tmp/hadoop-root-datanode.pid
	hdfs datanode
}

start_yarn_rm() {
	rm -f /tmp/hadoop-root-resourcemanager.pid 
	yarn resourcemanager
}

start_yarn_nm() {
	rm -f /tmp/hadoop-root-nodemanager.pid
	yarn nodemanager
}

echo $1

case $1 in
	hdfs-nn)
		start_hdfs_nn
		;;
	hdfs-snn)
		start_hdfs_snn
		;;
	hdfs-dn)
		start_hdfs_dn
		;;
	yarn-rm)
		start_yarn_rm
		;;
	yarn-nm)
		start_yarn_nm
		;;
	*)
		echo "Only { hdfs-nn | hdfs-snn | hdfs-dn | yarn-rm | yarn-nm } are valid!"
		;;
esac
