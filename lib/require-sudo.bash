#!/bin/bash

if [ `id -u` != 0 ]; then
	echo "You must be root for this script to work (hint: try sudo)";
	exit;
fi
