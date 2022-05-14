#!/bin/bash

#directory where all challenges are stored
cd /Users/perf/Documents/coding/ctf

#creating a directory named as the first argument
mkdir $1

# going to the new dir
cd $1
name=$2
# check if its a file or a link
if [ "${name:0:4}" = "http" ]
then

    echo "# LINK CHALLENGE
    $2
    ">links.md

else

    # copy the challenge files to the directory
    cp /Users/perf/Downloads/$2 .

fi 

#open vscode
code .