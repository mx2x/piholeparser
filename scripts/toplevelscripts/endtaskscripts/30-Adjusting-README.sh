#!/bin/bash
## Adjusting Readme.md

## Variables
SCRIPTBASEFILENAME=$(echo `basename $0 | cut -f 1 -d '.'`)
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../../scriptvars/
STATICVARS="$SCRIPTVARSDIR"staticvariables.var
if
[[ -f $STATICVARS ]]
then
source $STATICVARS
else
echo "Static Vars File Missing, Exiting."
exit
fi
if
[[ -f $TEMPVARS ]]
then
source $TEMPVARS
else
echo "Temp Vars File Missing, Exiting."
exit
fi

RECENTRUN="$ENDTASKSCRIPTSLOGDIR""$SCRIPTBASEFILENAME".md
STARTTIMEMD="Script Started At $STARTTIME"
ENDTIMEMD="Script Ended At $ENDTIME"
TOTALRUNTIMEMD="Script Took $TOTALRUNTIME Minutes To Filter $HOWMANYSOURCELISTS Lists."
AVERAGELISTPARSINGTIMEMD="Average Parsing Time Was $AVERAGEPARSETIME Minutes."
EDITEDALLPARSEDSIZEMBMD="The Edited AllParsed File is $EDITEDALLPARSEDSIZEMB MB."
THEMAINLOGFILE="[Log Of Recent Run]("$RECENTRUNLOGSDIRRAWMD")"
LISTSWITHOUTHTTPSLOG="[Lists that do NOT uses https]("$RECENTRUNWITHOUTHTTPSMD")"

rm $MAINREADME
s/RECENTRUNMAINLINK/$THEMAINLOGFILE/; s/LISTSWITHOUTHTTPSLINK/$LISTSWITHOUTHTTPSLOG/; sed "s/NAMEOFTHEREPOSITORY/$REPONAME/; s/AVERAGELISTPARSINGTIME/$AVERAGELISTPARSINGTIMEMD/; s/LASTRUNSTART/$STARTTIMEMD/; s/LASTRUNSTOP/$ENDTIMEMD/; s/TOTALELAPSEDTIME/$TOTALRUNTIMEMD/; s/EDITEDALLPARSEDSIZE/$EDITEDALLPARSEDSIZEMBMD/" $MAINREADMEDEFAULT > $MAINREADME
