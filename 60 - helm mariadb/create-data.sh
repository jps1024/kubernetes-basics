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
echo "CREATE TABLE IF NOT EXISTS TBL01 (COL01 char(10), COL02 char(10), COL03 char(10), COL04 char(10));"
for (( i=0; i<20200; i++ )); do
    a=$(randomstring10)
    b=$(randomstring10)
    c=$(randomstring10)
    d=$(randomstring10)
    echo "INSERT INTO TBL01 (COL01,COL02,COL03,COL04) VALUES (\"${a}\",\"${b}\",\"${c}\",\"${d}\");"
done
exit 0
