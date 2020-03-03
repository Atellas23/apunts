#!/bin/bash
argc=$#
argv=($@)

for((i=0; i<argc; i=i+2)); do
	echo running program ${argv[i+1]} at CPUid ${argv[i]}
	/usr/bin/time taskset -c ${argv[i]} ${argv[i+1]}&
done
