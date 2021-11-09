#!/bin/bash
########################################################

# Script Name: GRCh38_stratifiction_post-processing.sh

# Description: Post-process new GIAB GRCh38 stratifications for consistency. Run from .ipynb 

# Author: Jenny McDaniel (jennifer.mcdaniel@nist.gov)

# Date:  April 19, 2021

########################################################

# check if input BEDs are zipped and zip if they are not
date
bedtools --version

for f in ${INPUT38}*
do
OUTFILE=${INPUT38}$( basename ${f})

if [[ $f == *.bed ]] 
then
    echo "bgzipped: "$( basename ${f})
    bgzip < $f > ${OUTFILE}.gz
else
     echo "already zipped: "$( basename ${f})
fi
done

# run stratification post processing
for f in ${INPUT38}*.gz
do
    OUTFILE=${OUTPUT38}$( basename ${f})
    
	gzcat $f |
    sed 's/^chr//'|
    sed 's/^X/23/;s/^Y/24/'|
    grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS'|
    sort -k1,1n -k2,2n -k3,3n  |
    mergeBed -i stdin |
	sed 's/^23/X/;s/^24/Y/' |
    sed 's/^[a-zA-Z0-9_]/chr&/'|
    subtractBed -a stdin -b ${refNs}gap_38_1thruY_sorted_merged.bed | 
	subtractBed -a stdin -b ${refNs}PSA_Y_GRCh38.bed | 
    cat ${WKDIR}post-processing/header.txt - | 
 	bgzip > ${OUTFILE}
    echo "processed:  " $( basename ${f})
#     md5 ${OUTFILE} >> GRCh38_stratificationBEDs_for_Github_md5s.txt
done