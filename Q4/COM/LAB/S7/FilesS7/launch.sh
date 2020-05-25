#!/bin/bash
argc=$#
argv=($@)

echo $argc  " "  $argv

if [ $argc == 0 ]; then
	  echo "Us: $0 <hwthread> <program> [ <hwthread> <program> ...]"
	  echo
	  echo "   for example:   $0 2 ./integers 2 ./floats"
	  echo "       will execute  'integers' and 'floats' on the same hwthread 2"
	  echo "   and:           $0 2 ./integers 3 ./floats"
	  echo "       will execute  'integers' in hwthread 2 and 'floats' in hwthread 3"
	  echo
else

   for((i=0; i<argc; i=i+2)); do
	echo running program ${argv[i+1]} at CPUid ${argv[i]}
	/usr/bin/time taskset -c ${argv[i]} ${argv[i+1]}&
   done
fi 

