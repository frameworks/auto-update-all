#!/bin/sh

#write debug info to STDOUT
#set -x

if [ "$1" = "" ]; then
	echo "Usage: ./update_handlebars.sh <verison_number>"
	exit
fi

java -jar compiler.jar --js ../handlebars.js/handlebars.js --js_output_file ../handlebars.js/handlebars.min.js 
java -jar compiler.jar --js ../handlebars.js/handlebars.runtime.js --js_output_file ../handlebars.js/handlebars.runtime.min.js 

cd ..
cd handlebars.js/

git add .
git commit -m "${1}"
git push origin master
git tag -a "${1}" -m "version ${1}"
git push origin --tags

