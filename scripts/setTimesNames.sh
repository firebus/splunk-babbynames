#!/bin/bash

# touch $year $month $day $filename
function updateFileModTime {
    touch -d $1-$2-$3 $4
}

DAY=1
MONTH=1
YEAR=2000
FILES=`ls *.txt`
for file in $FILES
do
    updateFileModTime $YEAR $MONTH $DAY $file
    if [ "$?" -ne "0" ]; then
	MONTH=`expr $MONTH + 1`
        DAY=1
	updateFileModTime $YEAR $MONTH $DAY $file
    fi
    DAY=`expr $DAY + 1`
done
