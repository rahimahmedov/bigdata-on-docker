#!/bin/bash

case $1 in
	zeppelin)
		zeppelin.sh
		;;
	*)
		echo "Only { zeppelin } is valid!"
		;;
esac
