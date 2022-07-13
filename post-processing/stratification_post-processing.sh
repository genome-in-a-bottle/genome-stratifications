#!/bin/bash
########################################################

## Script Name: stratifiction_post-processing.sh

## Author: Jenny McDaniel (jennifer.mcdaniel@nist.gov)

## Date:  May 25, 2022

## Description: Post-process new GIAB stratifications for consistency. Run from .ipynb for each stratification type.  All references (GRCh37/38, CHM13) can be post-processed with this script. In general this script copies the input file to post-processing directory, removes all non-chroms, sorts, merges, subtracts N's, adds GIAB header and zips. This script should be run from the post-processing directory.

# This script takes three inputs:
# -i = directory of bed files to be post-processed
# -n = directory of bed files to subtract, e.g. gaps (N's). This is used just in case the files are somewhere other than in the post-processing directory. 
# -r = reference (GRCh37, GRCh38 or CHM13), this will determine that the file is processed appropriate for reference


# Since we now have XY files these are handled differently in the script because they require different subtractions.  Current scripts subtracts Ns as follows:
# 	All stratifications OTHER THAN those is XY:
# 	GRCh3X -- subtract gaps and PSA-Y
# 	CHM13 -- no subtractions
# 	All strats in XY:
# 	GRCh3X -- only subtract gaps
#	CHM13 -- no subtractions

## Use example:
# sh stratification_post-processing.sh -i <statification-type_input-directory> -n <directory_of_files_for_subtraction> -r <reference e.g. GRCh37, GRCh38, CHM13>
# e.g. `sh ../stratification_post-processing.sh -i ../GRCh38/LowComplexity/ -n refNs/ -r GRCh38`
########################################################

date
bedtools --version

while getopts i:n:r: flag
do
	case "$flag" in
		i) input_dir="${OPTARG}";;
		#S) strat_type=${OPTARG};;
		n) refNs="${OPTARG}";;
		r) ref="${OPTARG}";;
		# *)
	esac
done

## make directories for post processing stratifications
# directory used for processing intermediates will be removed at end
PROCESSING_DIR="$( basename "${input_dir}")"
mkdir -p $PROCESSING_DIR
# directories for output of script
PROCESSED_DIR=post-processed/"${ref}"/"$( basename "${input_dir}")"
mkdir -p $PROCESSED_DIR

echo "ref is: ${ref} "
echo $PROCESSING_DIR
echo $PROCESSED_DIR

#########################################
## GRCh38 POST-PROCESSING
#########################################

if [[ ${ref} == GRCh38 ]];then
echo "Processing for GRCh38"
	## Check if input stratification type is XY
	if [[ $( basename "${input_dir}") == XY ]]; then
		for f in "$input_dir"*
		do
			# name of original stratification file (file in input directory)
			INPUT_STRAT=$( basename "${f}") 

			## check if input BEDs are zipped and process based on zip state
			if [[ $f == *.bed ]];
			## if strat is not zipped, it will be zipped and before post processing
			then
				cp "$f" "$PROCESSING_DIR"

				echo "processing XY: $f"

				sed 's/^chr//' "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				subtractBed -a stdin -b $refNs"gap_38_1thruY_sorted_merged.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}".gz
				
				echo "processed XY:  " $( basename ${f})

			## if strat is already zipped do nothing except copy the stratification to post processing directory.
			elif [[ $f == *.bed.gz ]]; then
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				gzcat "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^chr//' | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				subtractBed -a stdin -b $refNs"gap_38_1thruY_sorted_merged.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}"
			
				echo "processed XY:  " $( basename ${f})
			fi
		done
		rm -r $PROCESSING_DIR
    ## for all other stratification types do this (difference is subtraction also includes PSAY regions)
	else
		for f in "$input_dir"*
		do
			# name of original stratification file (file in input directory)
			INPUT_STRAT=$( basename "${f}") 

			## check if input BEDs are zipped and process based on zip state
			if [[ $f == *.bed ]]
			## if strat is not zipped, it will be zipped and before post processing
			then
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				sed 's/^chr//' "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				subtractBed -a stdin -b $refNs"gap_38_1thruY_sorted_merged.bed" | \
				subtractBed -a stdin -b $refNs"PSA_Y_GRCh38.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}".gz
				
				echo "processed:  " $( basename ${f})

			## if strat is already zipped do nothing except copy the stratification to post processing directory.
			elif [[ $f == *.bed.gz ]]; then	
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				gzcat "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^chr//' | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				subtractBed -a stdin -b $refNs"gap_38_1thruY_sorted_merged.bed" | \
				subtractBed -a stdin -b $refNs"PSA_Y_GRCh38.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}"
			
				echo "processed:  " $( basename ${f})
			fi
		done
		rm -r $PROCESSING_DIR
	fi 

#########################################
## GRCh37 POST-PROCESSING
#########################################

elif [[ ${ref} == GRCh37 ]];then
echo "Processing for GRCh37"
	## Check if input stratification type is XY
	if [[ $( basename "${input_dir}") == XY ]]; then
		for f in "$input_dir"*
		do
			# name of original stratification file (file in input directory)
			INPUT_STRAT=$( basename "${f}") 

			## check if input BEDs are zipped and process based on zip state
			if [[ $f == *.bed ]];
			## if strat is not zipped, it will be zipped and before post processing
			then
				cp "$f" "$PROCESSING_DIR"

				echo "processing XY: $f"

				sed 's/^X/23/;s/^Y/24/' "$PROCESSING_DIR/${INPUT_STRAT}" | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				subtractBed -a stdin -b $refNs"hg19.gap_1thruY_sorted_merged.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}".gz
				
				echo "processed XY:  " $( basename ${f})

			## if strat is already zipped do nothing except copy the stratification to post processing directory.
			elif [[ $f == *.bed.gz ]]; then
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				gzcat "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				subtractBed -a stdin -b $refNs"hg19.gap_1thruY_sorted_merged.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}"
			
				echo "processed XY:  " $( basename ${f})
			fi
		done
		rm -r $PROCESSING_DIR
	## for all other stratification types do this (difference is subtraction also includes PSAY regions)
    else
		for f in "$input_dir"*
		do
			# name of original stratification file (file in input directory)
			INPUT_STRAT=$( basename "${f}") 

			## check if input BEDs are zipped and process based on zip state
			if [[ $f == *.bed ]]
			## if strat is not zipped, it will be zipped and before post processing
			then
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				sed 's/^X/23/;s/^Y/24/' "$PROCESSING_DIR/${INPUT_STRAT}" | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				subtractBed -a stdin -b $refNs"hg19.gap_1thruY_sorted_merged.bed" | \
				subtractBed -a stdin -b $refNs"PSA_Y_hg19.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}".gz
				
				echo "processed:  " $( basename ${f})

			## if strat is already zipped do nothing except copy the stratification to post processing directory.
			elif [[ $f == *.bed.gz ]]; then	
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				gzcat "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				subtractBed -a stdin -b $refNs"hg19.gap_1thruY_sorted_merged.bed" | \
				subtractBed -a stdin -b $refNs"PSA_Y_hg19.bed" | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}"
			
				echo "processed:  " $( basename ${f})
			fi
		done
		rm -r $PROCESSING_DIR
	fi 

#########################################
## CHM13 POST-PROCESSING
#########################################

elif [[ ${ref} == CHM13 ]];then
echo "Processing for CHM13"
	## Check if input stratification type is XY
	if [[ $( basename "${input_dir}") == XY ]]; then
		for f in "$input_dir"*
		do
			# name of original stratification file (file in input directory)
			INPUT_STRAT=$( basename "${f}") 

			## check if input BEDs are zipped and process based on zip state
			if [[ $f == *.bed ]];
			## if strat is not zipped, it will be zipped and before post processing
			then
				cp "$f" "$PROCESSING_DIR"

				echo "processing XY: $f"

				sed 's/^chr//' "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}".gz
				
				echo "processed XY:  " $( basename ${f})

			## if strat is already zipped do nothing except copy the stratification to post processing directory.
			elif [[ $f == *.bed.gz ]]; then
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				gzcat "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^chr//' | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}"
			
				echo "processed XY:  " $( basename ${f})
			fi
		done
		rm -r $PROCESSING_DIR
	## for all other stratification types perform the following
    else
		for f in "$input_dir"*
		do
			# name of original stratification file (file in input directory)
			INPUT_STRAT=$( basename "${f}") 

			## check if input BEDs are zipped and process based on zip state
			if [[ $f == *.bed ]]
			## if strat is not zipped, it will be zipped and before post processing
			then
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				sed 's/^chr//' "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}".gz
				
				echo "processed:  " $( basename ${f})

			## if strat is already zipped do nothing except copy the stratification to post processing directory.
			elif [[ $f == *.bed.gz ]]; then	
				cp "$f" "$PROCESSING_DIR"

				echo "processing: $f"

				gzcat "$PROCESSING_DIR/${INPUT_STRAT}" | \
				sed 's/^chr//' | \
				sed 's/^X/23/;s/^Y/24/' | \
				grep -Ev '^M|^[0-9][0-9]_|^[0-9]_|^[0-9]\||^[0-9][0-9]\||^Un|^HS' | \
				sort -k1,1n -k2,2n -k3,3n | \
				mergeBed -i stdin | \
				sed 's/^23/X/;s/^24/Y/' | \
				sed 's/^[a-zA-Z0-9_]/chr&/' | \
				cat header.txt - | \
				bgzip > "$PROCESSED_DIR/${INPUT_STRAT}"
			
				echo "processed:  " $( basename ${f})
			fi
		done
		rm -r $PROCESSING_DIR
	fi 

fi


