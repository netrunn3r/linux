#!/bin/bash

while ( true ); do
	clear
	df -hP -x tmpfs | cut -c 32- | perl -pe '$|=1; s/[ 123].%/\e[1;32m$&\e[0m/; s/[45678].%/\e[1;33m$&\e[0m/; s/[9].%/\e[1;31m$&\e[0m/'
	sleep 60
done
