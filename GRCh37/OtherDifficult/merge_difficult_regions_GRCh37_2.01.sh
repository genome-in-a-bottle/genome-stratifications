#!/bin/sh

#  Merge_difficult_regions_GRCh37_2.01.sh
#
#  Created by JZook, 12/13/16 for v2.0 stratificaitons
#  Updated by JZook, 1/3/19 to make everything reproducible and include v4.1 for HG002
#  Updated by JMcDaniel, 8/17/21 for v2.01.00,
#   -input files renamed to corresponding v2.0 stratification filenames
#   -moved GenomeSpecific merged bed to GS snakemake pipeline (see #4)
#  JZ used bedtools v2.25.0 (v.2.0 stratifications)
#  JM used bedtools v2.30.0 (v2.01 stratifications)

###############################################################################
## 1. Generate GRCh37_allOtherDifficultregions.bed.gz (input for step #3)
##
## merge other difficult regions (need to use subtractbed for vdj because it didn't work with multiintersectbed)
## JZ used bedtools v2.25.0 (v.2.0 stratifications)
## JM used bedtools v2.30.0 (v2.01 stratifications)
## inputs from existing v2.0 strats
###############################################################################
multiIntersectBed -i \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_hs37d5_decoy_alignments.bed.gz \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_gaps_slop15kb.bed.gz \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_contigs_lt500kb.bed.gz  \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_hg38_minimap2_asm20_N10_gt1contig_gt1kb.bed.gz \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_hg38_minimap2_asm20_N10_nocovgt1kb.bed.gz \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_L1H_gt500.bed.gz \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_MHC.bed.gz \
v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_missing_and_multiple_alignments_of_GRCh38.bed.gz \
| grep -v 'gl\|hap\|MT' \
| mergeBed -i stdin \
| subtractBed \
-a v2.0_stratifications/GRCh37/LowComplexity/intermediate_files/human.b37.genome.bed \
-b stdin \
| subtractBed \
-a stdin \
-b v2.0_stratifications/GRCh37/OtherDifficult/GRCh37_VDJ.bed.gz \
| subtractBed \
-a v2.0_stratifications/GRCh37/LowComplexity/intermediate_files/human.b37.genome.bed \
-b stdin \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh37/OtherDifficult/GRCh37_allOtherDifficultregions.bed.gz

if test -f v2.01_stratifications/merge_script_output_files/GRCh37/OtherDifficult/GRCh37_allOtherDifficultregions.bed.gz; then
    echo "GRCh37_allOtherDifficultregions.bed.gz"
    date >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
    md5 v2.01_stratifications/merge_script_output_files/GRCh37/OtherDifficult/GRCh37_allOtherDifficultregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

###############################################################################
## 2. Generate GRCh37_alllowmapandsegdupregions.bed.gz and
##    GRCh37_notinalllowmapandsegdupregions.bed.gz -- no changes to these file from 2.0
##
## merge all low mappable and seg dup regions
## inputs from existing v2.0 strats
###############################################################################
multiIntersectBed -i \
v2.0_stratifications/GRCh37/mappability/GRCh37_lowmappabilityall.bed.gz \
v2.0_stratifications/GRCh37/SegmentalDuplications/GRCh37_segdups.bed.gz \
| grep -v 'gl\|hap\|MT' \
| mergeBed -i stdin \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alllowmapandsegdupregions.bed.gz

if test -f v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alllowmapandsegdupregions.bed.gz; then
    echo "GRCh37_alllowmapandsegdupregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alllowmapandsegdupregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

subtractBed \
-a v2.0_stratifications/GRCh37/LowComplexity/intermediate_files/human.b37.genome.bed \
-b v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alllowmapandsegdupregions.bed.gz \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_notinalllowmapandsegdupregions.bed.gz

if test -f v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_notinalllowmapandsegdupregions.bed.gz; then
    echo "GRCh37_notinalllowmapandsegdupregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_notinalllowmapandsegdupregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

###############################################################################
## 3. Generate GRCh38_alldifficultregions.bed.gz
##    and GRCh38_notinalldifficultregions.bed.gz (input for step #4)
##
## merge all difficult regions
## inputs from existing 2.0 strats and step #1 above
###############################################################################
multiIntersectBed -i \
v2.0_stratifications/GRCh37/mappability/GRCh37_lowmappabilityall.bed.gz \
v2.0_stratifications/GRCh37/GCcontent/GRCh37_gclt25orgt65_slop50.bed.gz \
v2.0_stratifications/GRCh37/LowComplexity/GRCh37_AllTandemRepeatsandHomopolymers_slop5.bed.gz \
v2.0_stratifications/GRCh37/SegmentalDuplications/GRCh37_segdups.bed.gz \
v2.0_stratifications/GRCh37/FunctionalTechnicallyDifficultRegions/GRCh37_BadPromoters.gz \
v2.01_stratifications/merge_script_output_files/GRCh37/OtherDifficult/GRCh37_allOtherDifficultregions.bed.gz \
| grep -v 'gl\|hap\|MT' \
| mergeBed -i stdin \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alldifficultregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alldifficultregions.bed.gz; then
    echo "GRCh37_alldifficultregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alldifficultregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi

subtractBed \
-a v2.0_stratifications/GRCh37/LowComplexity/intermediate_files/human.b37.genome.bed \
-b v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_alldifficultregions.bed.gz \
| bgzip -c > v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_notinalldifficultregions.bed.gz
if test -f v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_notinalldifficultregions.bed.gz; then
    echo "GRCh37_notinalldifficultregions.bed.gz"
    md5 v2.01_stratifications/merge_script_output_files/GRCh37/union/GRCh37_notinalldifficultregions.bed.gz >> v2.01_stratifications/merge_script_output_files/merge_difficult_regions_md5s.txt
fi


###############################################################################
## MOVED TO "generate_new_GenomeSpecic_strats" snakemake pipeline
## 4. Generate genomespecific_complexandSVs_alldifficultregions and
##    notin_genomespecific_complexandSVs_alldifficultregions
##
## merge genomespecific and alldifficultregions
## inputs from new 2.01 GenomeSpecific strats (complexandSVs) nd step #3 above
###############################################################################
