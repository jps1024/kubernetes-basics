#!/usr/bin/env bash


##
## FUNCTION randomstring10
##
function randomstring10() {
    ret=$(echo $RANDOM | md5sum | head -c 10)
    echo "$ret"
}


##
## START OF THE SCRIPT
##
for (( i=0; i<31000; i++ )); do
    a=$(randomstring10)
    echo "SELECT COL01,COL02,COL03,COL04 from TBL01 where COL01=\"${a}\" OR COL02=\"${a}\" OR COL03=\"${a}\" OR COL04=\"${a}\";"
done

exit 0
