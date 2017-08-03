#!/bin/bash
## This is where any script dependencies will go.
## It checks if it is installed, and if not,
## it installs the program

## Variables
script_dir=$(dirname $0)
source "$script_dir"/../scriptvars/staticvariables.var

echo ""

## Start File Loop
## For .dependency files In The dependencies Directory
for f in $DEPENDENCIESALL
do

## Declare File Name

BASEFILENAME=$(echo `basename $f | cut -f 1 -d '.'`)
printf "$cyan"  "Checking For $BASEFILENAME"

## Shouldn't be more than one source here
for source in `cat $f`;
do

WHATITIS=$BASEFILENAME
WHATPACKAGE=$source
timestamp=$(echo `date`)
if
which $WHATITIS >/dev/null;
then
printf "$yellow"  "$WHATITIS Is Already Installed."
else
printf "$yellow"  "Installing $WHATITIS"
apt-get install -y $WHATPACKAGE
fi
echo ""

## End Of Loops
done
done