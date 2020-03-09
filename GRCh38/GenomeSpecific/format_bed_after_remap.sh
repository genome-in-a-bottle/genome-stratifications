#!/bin/bash
#
#Format BED files following NCBI remap of GRCh37 to GRCh38 BED files. Output is zipped, 3-field sorted bed file that contains chromosomes 1-22, X and Y.  Chromosome names contain "chr" prefix.
#Run from directory containing remapped beds.

## Create directory to hold remapped formatted BED files
mkdir formatted_remapped_beds

## Format 3-field remapped BED files to included sorted chromosomes only with "chr" prefix
FILE=*.bed
for filename in $FILE
do
	echo $filename
	cut -f -1 $filename| sort -V | uniq
	grep "^[0-9XY]" $filename | 
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n | 
	sed 's/^23/X/;s/^24/Y/' | 
	sed 's/^[a-zA-Z0-9_]/chr&/' > ./formatted_remapped_beds/GRCh38_$filename
	cut -f -1 ./formatted_remapped_beds/GRCh38_$filename |sort -V| uniq
done 

##bgzip all BED files in remapped directory
FILE=./formatted_remapped_beds/*.bed
for filename in $FILE
do
	bgzip $filename
done


