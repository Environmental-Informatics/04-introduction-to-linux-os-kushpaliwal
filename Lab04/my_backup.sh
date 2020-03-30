#!/bin/bash
#Backs up a single project file
# kushpaliwal 29/3/2020

# If the file is a directory?
if [ $# != 1 ]
then
    echo Usage: A single argument is the directory to backup
    exit
fi

# If the file exists?
if [ ! -d $1 ]
then
    echo 'The given file does not seem to exist(possible typo?)'
    exit
fi
date=`date +%F`

# Do we already have a backup for todays date?
if [ -d projectbackups/$1_$date ]
then
    echo 'This project has already been backed up today, overwrite?'
    read answer
    if [ $answer != 'y' ]
    then
        exit
    fi
else
    mkdir projectbackups/$1_$date
fi
cp -R $1 projectbackups/$1_$date
echo backups of $1 is completed
