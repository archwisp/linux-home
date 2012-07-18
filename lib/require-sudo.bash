#!/bin/bash

if [ `id -u` != 0 ]; then

	printf "You must be root for this script to work (hint: try sudo)";
	echo;
	exit;

fi
