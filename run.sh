#!/bin/bash

if [[ -z $1 ]];
then 
    echo "No argument passed, running the large input set by default."
    python3 /root/vsGibbon/generate_runtimes.py
    python3 /root/vsGibbon/generate_compile_times.py
    cd /root/vsGHC/ && python3 generate_ghc_numbers.py

else
    if [ "$1" != "--small" ]
    then 
	echo "Correct argument not passed: Options: [--small]"
        exit 1
    fi	
    echo "Running the small input set."
    python3 /root/vsGibbon/generate_runtimes.py $1
    python3 /root/vsGibbon/generate_compile_times.py 
    cd /root/vsGHC/ && python3 generate_ghc_numbers.py $1
fi



