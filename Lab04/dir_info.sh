# !/bin/bash
# Script to provide information about a given directory
# kushpaliwal 29/3/2020

# Number of files in a directory

count=`ls -l $1 | egrep -c '^-'`
echo The number of files in the directory $1 is $count

# Number of directories in the directory

num=`ls -l $1 | egrep -c ^d`
echo The number of directories in the directory $1 is $num

# Biggest file inside the directory

bgst=`ls -lSh $1 | grep ^- | head -1 | awk '{print $9}'`
echo The biggest file in the directory $1 is $bgst

# Most recently modified or created file

mod=`ls -lt $1 | grep ^- | head -1 | awk '{print $9}'`
echo The most recently modified or created file in the directory $1 is $mod

# Name of the owners of the files in the directory

own=`ls -lhR $1 | awk '{print $3}' | uniq -d`
echo The owners of the files in the directory: $own
