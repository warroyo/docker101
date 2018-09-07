#!/bin/sh

echo "App Version: $APP_VERSION"

if [ $# -lt  1 ]
then
        echo "no valid arguments"
        exit 1
fi

case "$1" in
-r)
    echo "running basic docker image"
    sleep 20
    echo "shutting down"
    exit
    ;;
-v)  
    echo "version: 1.0.0"
    exit
    ;;
*) echo "argument $1 is not valid"
   ;;
esac