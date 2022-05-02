#!/bin/bash

help()
{
echo "Syntax:- bash script.sh -f <logfile> -remoteip <x.x.x.x>"
}




function main()
	{

cat $file | grep "^$IP" | while read -r log;do awk '{print "-----------------------" "\n" "IP: " $1 "\n" "---------------------------"  "\n" "TIMESTAMP: " $4 "\n" "HTTP METHOD: " $6 "\n" "Endpoint: " $7 "\n" "HTTP_STATUS: " $9 "\n" "USER_AGENT: " $12 "\n" "----------------------------------" "\n"}';done 

	}


while [ 2 -le $# ];
do
	case "$1" in
		"-f")
		       file=$2
		       shift
		       	;;

		"-remoteip")
			IP=$2
			shift
			;;

		"-httpmethod")
			method=$2
			shift
			;;

		"-h"|"--help")
				help
				exit 0
				;;
		"")
			printf "One argument required. Use \"-h/--help\"\n"
			help
			exit 1
			;;	
		*)
			printf "Error: $1 invalid argument. Use \"-h/--help\"\n"
			exit 1
			;;			
	esac
	shift

done



main
