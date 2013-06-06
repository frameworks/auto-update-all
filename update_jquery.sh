#!/bin/sh

#write debug info to STDOUT
#set -x

if [ "$1" = "" ]; then
	echo "Usage: ./update_jquery.sh <verison_number>"
	exit
fi

VERSION_NUMBER=$1

cd ..
cd jquery/

curl http://code.jquery.com/jquery-${1}.min.js > jquery.min.js
curl http://code.jquery.com/jquery-${1}.js > jquery.js

git add .
git commit -m "${1}"
git push origin master
git tag -a "${1}" -m "version ${1}"
git push origin --tags

