#!/bin/bash
#
#Unzip BED file and remove the first three fields.  This leaves the required parts of a BED file (chr, start and stop).
#Run from directory that contains zipped BED files for trimming.

FILE=*.gz
for filename in $FILE
do
	echo $filename
gunzip -c $filename | cut -f 1-3 | gzip > ./three_field_beds/$filename
done 