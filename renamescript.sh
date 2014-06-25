#!/bin/bash

dir="Test"
OLDIFS=$IFS
export IFS=$(echo -en "\n\b")
for i in `ls -a $dir`
do
	modified=$(echo $i | sed 's/__/_________/g')
	mv $dir/$i $dir/$modified
done
export IFS=$OLDIFS
