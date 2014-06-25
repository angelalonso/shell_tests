#!/bin/bash

FILEIN="`pwd`/in.txt"
FILEOUT="`pwd`/fileout"
echo $JOBID
let count=0
for WORD in `cat ${FILEIN}`
do
	echo $WORD" 1"
	let count=$((count+1))
done
