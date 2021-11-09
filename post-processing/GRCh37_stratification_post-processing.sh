#!/bin/bash
########################################################

# Script Name: GRCh37_stratifiction_post-processing.sh

# Description: Post-process new GIAB GRCh37 stratifications for consistency. Run from .ipynb 

# Author: Jenny McDaniel (jennifer.mcdaniel@nist.gov)

# Date:  April 19, 2021

########################################################

date
bedtools --version 

for f in ${INPUT37}*
do
OUTFILE37=${INPUT37}$( basename ${f})

if [[ $f == *.bed ]] 
then
    echo "bgzipped: "$( basename ${f})
    bgzip < $f > ${OUTFILE37}.gz
else
     echo "already zipped: "$( basename ${f})
fi
done

for f in ${INPUT37}*.gz
do
    OUTFILE=${OUTPUT37}$( basename ${f})
    
	gzcat $f |
    sed 's/^chr//'|
    sed 's/^X/23/;s/^Y/24/'|
    grep -Ev '^M|^GL|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS'|
    sort -k1,1n -k2,2n -k3,3n  |
    mergeBed -i stdin |
	sed 's/^23/X/;s/^24/Y/' |
    subtractBed -a stdin -b ${refNs}hg19.gap_1thruY_sorted_merged.bed | 
	subtractBed -a stdin -b ${refNs}PSA_Y_hg19.bed | 
    cat ${WKDIR}post-processing/header.txt - | 
 	bgzip > ${OUTFILE}
    echo "processed:  " $( basename ${f})
#     md5 ${OUTFILE} >> GRCh37_stratificationBEDs_for_Github_md5s.txt
    
done
