#!/bin/bash

# Assuming you have fewer than 365 *.txt files in the directory, this will give each file a different mod date

# touch $year $month $day $filename
function updateFileModTime {
    touch -d $1-$2-$3 $4
}

DAY=1
MONTH=1
YEAR=2010
FILES=`ls *.txt`
for file in $FILES; do
    updateFileModTime $YEAR $MONTH $DAY $file
    # If updateFileModTime failed because you passed it a bad date, then it must be time to increment the month!
    if [ "$?" -ne "0" ]; then
        MONTH=`expr $MONTH + 1`
        DAY=1
        updateFileModTime $YEAR $MONTH $DAY $file
    fi
    DAY=`expr $DAY + 1`
done