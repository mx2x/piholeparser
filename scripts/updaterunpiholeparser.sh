#!/bin/bash
## This script resides outside of the main directory 
## for the purpose of updating without worrying about being overwritten
##
## This File will not be updated often.

## Variables
script_dir=$(dirname $0)
#REPONAMED=$(echo `basename $0 | cut -f 1 -d '.'`)
REPONAMED=piholeparser
MAINVAR="$script_dir"/"$REPONAMED".var
CHECKME=$MAINVAR
if
ls $CHECKME &> /dev/null;
then
echo "Main Vars Check Successful"
source $MAINVAR
else
echo "Main Vars File Missing, Exiting."
exit
fi

if
[[ ! -d "$REPODIR" ]]
then
echo ""
echo "piholeparser Directory Missing. Cloning Now."
echo ""
git clone $GITREPOSITORYURLB $REPODIR
fi

printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Updating Repository."
git -C $REPODIR pull
printf "$magenta" "___________________________________________________________"
echo ""

source "$REPODIR"scripts/scriptvars/staticvariables.var

## RunParser
bash $RUNPIHOLEPARSERSCRIPT