#!/bin/bash

if [ $# -lt 2 ]
then
	echo -e "\e[91mNot enough arguments supplied"
	echo -e "\e[93mUsage: repo_scan.sh <target directory> <output directory>"
	echo "Example: repo_scan.sh phoenix/ phoenix/secrets/"
	exit 1
fi

echo -e "\n### Starting secret scanning..."
startdir=`pwd`
cd $1
dirs=`ls --directory */`

for dir in $dirs
do
	echo -e "\n### Looking for secrets in:" $dir "...\n"
	cd $dir
	gittyleaks --find-anything > $startdir/$2${dir%?}"_secrets".txt
	if [ $? = 0 ]
	then
		echo -e "\e[92m### Done! Wrote to:" $startdir/$2${dir%?}"_secrets".txt"\e[0m"
	fi
	cd ..
done
