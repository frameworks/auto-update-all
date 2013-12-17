#!/bin/sh

#write debug info to STDOUT
#set -x

if [ "$1" = "" ]; then
	echo "Usage: ./update_ember.sh <verison_number>"
	exit
fi

VERSION_NUMBER=$1

cd ..
cd ember.js/


curl http://builds.emberjs.com/tags/v${1}/ember.js > ember.js
curl http://builds.emberjs.com/tags/v${1}/ember.min.js > ember.min.js
curl http://builds.emberjs.com/tags/v${1}/ember.prod.js > ember.prod.js

git add .
git commit -m "${1}"
git push origin master
git tag -a "${1}" -m "version ${1}"
git push origin --tags

