#!/bin/bash
## Checks if github mirror present

## Variables
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
[[ -f $TEMPPARSEVARS ]]
then
source $TEMPPARSEVARS
else
echo "Temp Parsing Vars File Missing, Exiting."
exit
fi

if
[[ `wget -S --spider $MIRROREDFILEDL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]
then
printf "$green"  "Github Mirror File Currently Available."
GIFILEONLINE=true
echo "GIFILEONLINE="$GIFILEONLINE"" | tee --append $TEMPPARSEVARS &>/dev/null
else
printf "$red"  "Github Mirror File Currently Unavailable."
fi
