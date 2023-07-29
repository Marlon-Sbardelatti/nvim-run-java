#!/bin/bash

LOCATION=$(pwd)
PROJECTNAME=$(basename $(pwd))

if [ $(basename $LOCATION) == "src" ]; then
    cd ..
    PROJECTNAME=$(basename $(pwd))
    cd out/production/$PROJECTNAME
    LOCATION=$(pwd)
    java -cp $LOCATION $1
elif [ $(basename $LOCATION) == "out" ]; then
    cd ..
    PROJECTNAME=$(basename $(pwd))
    cd out/production/$PROJECTNAME
    LOCATION=$(pwd)
    java -cp $LOCATION $1
elif [ $(basename $LOCATION) == "production" ]; then
    cd ..
    cd ..
    PROJECTNAME=$(basename $(pwd))
    cd out/production/$PROJECTNAME
    LOCATION=$(pwd)
    java -cp $LOCATION $1
elif [ $(basename $LOCATION) == $PROJECTNAME ]; then
    cd ..
    if [ $(basename $(pwd)) == "production" ]; then
        cd ..
        cd ..
        PROJECTNAME=$(basename $(pwd))
        cd out/production/$PROJECTNAME
        LOCATION=$(pwd)
        java -cp $LOCATION $1
    else
        cd $PROJECTNAME
        cd out/production/$PROJECTNAME
        LOCATION=$(pwd)
        java -cp $LOCATION $1
    fi
else
    echo "You are not in the right directory"
fi
