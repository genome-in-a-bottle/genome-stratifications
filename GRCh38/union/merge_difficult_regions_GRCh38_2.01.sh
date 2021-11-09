#!/bin/sh

#  Merge_difficult_regions_GRCh38_2.01.sh
#  
#  Created by JZook, 12/11/18 for v2.0 stratificaitons
#  Updated by JZook, 1/7/19 to make everything reproducible and include v4.1 for HG002
#  Updated by JMcDaniel, 8/17/21 for v2.01.00 
#   -input files renamed to corresponding v2.0 stratification filenames
#   -moved GenomeSpecific merged bed to GS snakemake pipeline (see #4)
#  JZ used bedtools v2.25.0 (v.2.0 stratifications)
#  JM used bedtools v2.30.0 (v2.01 stratifications)

###############################################################################
## 1. Generate GRCh38_allOtherDifficultregions.bed.gz (input for step #3)
##
## merge other difficult regions (need to use subtractbed for vdj because it didn't work with multiintersectbed)
## inputs from existing v2.0 strats and new 2.01 T2T-based strats (OtherDifficult)
###############################################################################
multiIntersectBed -i \
v2.0_stratifications/GRCh38/OtherDifficult/GRCh38_gaps_slop15kb.bed.gz \
v2.0_stratifications/GRCh38/OtherDifficult/GRCh38_contigs_lt500kb.bed.gz \
v2.0_stratifications/GRCh38/OtherDifficult/GRCh38_L1H_gt500.bed.gz \
v2.0_stratifications/GRCh38/OtherDifficult/GRCh38_MHC.bed.gz \
v2.01_stratifications/input_files/GRCh38/OtherDifficult/GRCh38_false_duplications_correct_copy.bed.gz \
v2.01_stratifications/input_files/GRCh38/OtherDifficult/GRCh38_false_duplications_incorrect_copy.bed.gz \
v2.01_stratifications/input_files/GRCh38/OtherDifficult/GRCh38_collapsed_duplication_FP_regions.bed.gz \
v2.01_stratifications/input_files/GRCh38/OtherDifficult/GRCh38_population_CNV_FP_regions.bed.gz \
v2.01_stratifications/input_files/GRCh38/OtherDifficult/GRCh38_LD_discordant_haplotypes_slop5bp.bed.gz \
v2.01_stratifications/input_files/GRCh38/OtherDifficult/GRCh38_gnomAD_InbreedingCoeff_slop1bp_merge1000bp.bed.gz \
| grep -v 'gl\|hap\|MT' \
| mergeBed -i stdin \
| subtractBed \
-a v2.0_stratifications/GRCh38//LowComplexity/intermediate_files/human.b38.genome.bed \
-b stdin \
| subtractBed \
-a stdin \
-b v2.0_stratifications/GRCh38/OtherDifficult/GRCh38_VDJ.bed.gz \
| subtractBed \
-a v2.0_stratifications/GRCh38/LowComplexity/intermediate_files/human.b38.genome.bed \
-b stdin \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh38/OtherDifficult/GRCh38_allOtherDifficultregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh38/OtherDifficult/GRCh38_allOtherDifficultregions.bed.gz; then
    echo "GRCh38_allOtherDifficultregions.bed.gz"
    date >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
    md5 v2.01_stratifications/merge_script_output_files/GRCh38/OtherDifficult/GRCh38_allOtherDifficultregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

###############################################################################
## 2. Generate GRCh38_alllowmapandsegdupregions.bed.gz and
##    GRCh38_notinalllowmapandsegdupregions.bed.gz -- no changes to these file from 2.0
##
## merge all low mappable and seg dup regions
## inputs from existing v2.0 strats 
###############################################################################
multiIntersectBed -i \
v2.0_stratifications/GRCh38/mappability/GRCh38_lowmappabilityall.bed.gz \
v2.0_stratifications/GRCh38/SegmentalDuplications/GRCh38_segdups.bed.gz \
| grep -v 'gl\|hap\|MT' \
| mergeBed -i stdin \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alllowmapandsegdupregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alllowmapandsegdupregions.bed.gz; then
    echo "GRCh38_alllowmapandsegdupregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alllowmapandsegdupregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

subtractBed \
-a v2.0_stratifications/GRCh38/LowComplexity/intermediate_files/human.b38.genome.bed \
-b v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alllowmapandsegdupregions.bed.gz \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_notinalllowmapandsegdupregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_notinalllowmapandsegdupregions.bed.gz; then
    echo "GRCh38_notinalllowmapandsegdupregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_notinalllowmapandsegdupregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

###############################################################################
## 3. Generate GRCh38_alldifficultregions.bed.gz 
##    and GRCh38_notinalldifficultregions.bed.gz (input for step #4)
##
## merge all difficult regions
## inputs from existing 2.0 strats and step #1 above
###############################################################################
multiIntersectBed -i \
v2.0_stratifications/GRCh38/mappability/GRCh38_lowmappabilityall.bed.gz \
v2.0_stratifications/GRCh38/GCcontent/GRCh38_gclt25orgt65_slop50.bed.gz \
v2.0_stratifications/GRCh38/LowComplexity/GRCh38_AllTandemRepeatsandHomopolymers_slop5.bed.gz \
v2.0_stratifications/GRCh38/SegmentalDuplications/GRCh38_segdups.bed.gz \
v2.0_stratifications/GRCh38/FunctionalTechnicallyDifficultRegions/GRCh38_BadPromoters.bed.gz \
v2.01_stratifications/merge_script_output_files/GRCh38/OtherDifficult/GRCh38_allOtherDifficultregions.bed.gz \
| grep -v 'gl\|hap\|MT' \
| mergeBed -i stdin \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alldifficultregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alldifficultregions.bed.gz; then
    echo "GRCh38_alldifficultregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alldifficultregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

subtractBed \
-a v2.0_stratifications/GRCh38//LowComplexity/intermediate_files/human.b38.genome.bed \
-b v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_alldifficultregions.bed.gz \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_notinalldifficultregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_notinalldifficultregions.bed.gz; then
    echo "GRCh38_notinalldifficultregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh38/union/GRCh38_notinalldifficultregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

###############################################################################
## MOVED TO "generate_new_GenomeSpecic_strats" snakemake pipeline
## 4. Generate genomespecific_complexandSVs_alldifficultregions and
##    notin_genomespecific_complexandSVs_alldifficultregions
## 
## merge genomespecific and alldifficultregions
## inputs from new 2.01 GenomeSpecific strats (complexandSVs) nd step #3 above
###############################################################################
