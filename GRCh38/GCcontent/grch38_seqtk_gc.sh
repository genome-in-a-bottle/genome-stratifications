#!/bin/sh

#  seqtk_gc.sh
#  Generate standardized GC content bed files with different GC content ranges using seqtk for the Global Alliance for Genomics and Health Benchmarking Team and Genome in a Bottle
#  First generate regions with <15, 20, 25, and 30% GC and >55, 60, 65, 70, 75, 80, and 85 % GC
#  Expand by 50bp on each side to get "200 bp regions in which the middle 100bp contains <x% or >x% GC", based on doi:10.1186/gb-2013-14-5-r51
#  Subtract more stringent bed from less stringent bed to get GC content ranges
#  Everything else goes in 30to65 bed file for moderate GC (this range was chosen based on where coverage starts decreasing or error rates start increasing for any technology in doi:10.1186/gb-2013-14-5-r51
#  Note that after adding 50bp slop, 274889 bp overlap between gc30 and gc65, or 0.05% of gc30 and 0.5% of gc65, so the bed files with different GC ranges are almost exclusive of each other, but not completely
#  original seqtk_gc.sh created by Zook, Justin at the National Institute of Standards and Technology on 3/30/15.

#  grch38_seqtk_gc.sh
#  The original seqtk_gc.sh created by J.Zook in 2015 was updated and run using GRCh38 reference without decoy or ALT loci (GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz) on 6/20/19.  bedtools v2.27.1, tabix v1.9

###updated
seqtk gc -f 0.55 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc55.bed

seqtk gc -f 0.6 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc60.bed

seqtk gc -f 0.65 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc65.bed

seqtk gc -f 0.7 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc70.bed

seqtk gc -f 0.75 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc75.bed

seqtk gc -f 0.8 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc80.bed

seqtk gc -f 0.85 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc85.bed

#AT rich
seqtk gc -wf 0.7 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc30.bed

seqtk gc -wf 0.75 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc25.bed

seqtk gc -wf 0.8 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc20.bed

seqtk gc -wf 0.85 -l 100 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz  > l100_gc15.bed

#create primary chromosome only (1-22, X and Y) GC beds
FILE=*.bed
for filename in $FILE
do
	echo $filename
	cut -f -1 $filename| sort -V | uniq
	grep -e "^chr[0-9XY]\t" -e "^chr[12][0-9]\t" $filename | sed 's/^chrX/chr23/;s/^chrY/chr24/' | sort -k1 -V -k2,2n  | sed 's/^chr23/chrX/;s/^chr24/chrY/'  > GRCh38_$filename
	echo GRCh38_$filename
	cut -f -1 GRCh38_$filename | uniq
done 

#add 50bp on each side to get "200bp regions in which middle 100bp contains >x% GC or <x% GC. 
slopBed -i GRCh38_l100_gc55.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc55_slop50.bed

slopBed -i GRCh38_l100_gc60.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc60_slop50.bed

slopBed -i GRCh38_l100_gc65.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc65_slop50.bed

slopBed -i GRCh38_l100_gc70.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc70_slop50.bed

slopBed -i GRCh38_l100_gc75.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc75_slop50.bed

slopBed -i GRCh38_l100_gc80.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc80_slop50.bed

slopBed -i GRCh38_l100_gc85.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc85_slop50.bed

slopBed -i GRCh38_l100_gc30.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc30_slop50.bed

slopBed -i GRCh38_l100_gc25.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc25_slop50.bed

slopBed -i GRCh38_l100_gc20.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc20_slop50.bed

slopBed -i GRCh38_l100_gc15.bed -g /usr/local/bin/bedtools_genomes/human.b38.genome -b 50 | awk '$3>0' | mergeBed -i stdin > GRCh38_l100_gc15_slop50.bed


#get ranges of GC content by subtracting more stringent from more lenient gc contents.  Note that after adding 50bp slop, 274889 bp overlap between gc30 and gc65, or 0.05% of gc30 and 0.5% of gc65
#intersectBed -a GRCh38_l100_gc65_slop50.bed -b GRCh38_l100_gc30_slop50.bed | awk '{ sum+=$3;sum-=$2 } END { print sum }'
#274889

subtractBed -a GRCh38_l100_gc20_slop50.bed -b GRCh38_l100_gc15_slop50.bed > GRCh38_l100_gc15to20_slop50.bed

subtractBed -a GRCh38_l100_gc25_slop50.bed -b GRCh38_l100_gc20_slop50.bed > GRCh38_l100_gc20to25_slop50.bed

subtractBed -a GRCh38_l100_gc30_slop50.bed -b GRCh38_l100_gc25_slop50.bed > GRCh38_l100_gc25to30_slop50.bed

subtractBed -a GRCh38_l100_gc80_slop50.bed -b GRCh38_l100_gc85_slop50.bed > GRCh38_l100_gc80to85_slop50.bed

subtractBed -a GRCh38_l100_gc75_slop50.bed -b GRCh38_l100_gc80_slop50.bed > GRCh38_l100_gc75to80_slop50.bed

subtractBed -a GRCh38_l100_gc70_slop50.bed -b GRCh38_l100_gc75_slop50.bed > GRCh38_l100_gc70to75_slop50.bed

subtractBed -a GRCh38_l100_gc65_slop50.bed -b GRCh38_l100_gc70_slop50.bed > GRCh38_l100_gc65to70_slop50.bed

subtractBed -a GRCh38_l100_gc60_slop50.bed -b GRCh38_l100_gc65_slop50.bed > GRCh38_l100_gc60to65_slop50.bed

subtractBed -a GRCh38_l100_gc55_slop50.bed -b GRCh38_l100_gc60_slop50.bed > GRCh38_l100_gc55to60_slop50.bed

subtractBed -a /usr/local/bin/bedtools_genomes/human.hg38.chroms.only.genome.bed -b GRCh38_l100_gc55_slop50.bed | subtractBed -a stdin -b GRCh38_l100_gc30_slop50.bed > GRCh38_l100_gc30to55_slop50.bed

multiIntersectBed -i GRCh38_l100_gc15_slop50.bed GRCh38_l100_gc15to20_slop50.bed GRCh38_l100_gc20to25_slop50.bed GRCh38_l100_gc65to70_slop50.bed GRCh38_l100_gc70to75_slop50.bed GRCh38_l100_gc75to80_slop50.bed GRCh38_l100_gc80to85_slop50.bed GRCh38_l100_gc85_slop50.bed | mergeBed -i stdin > GRCh38_l100_gclt25orgt65_slop50.bed

multiIntersectBed -i GRCh38_l100_gc15_slop50.bed GRCh38_l100_gc15to20_slop50.bed GRCh38_l100_gc20to25_slop50.bed GRCh38_l100_gc25to30_slop50.bed GRCh38_l100_gc55to60_slop50.bed GRCh38_l100_gc60to65_slop50.bed GRCh38_l100_gc65to70_slop50.bed GRCh38_l100_gc70to75_slop50.bed GRCh38_l100_gc75to80_slop50.bed GRCh38_l100_gc80to85_slop50.bed GRCh38_l100_gc85_slop50.bed | mergeBed -i stdin > GRCh38_l100_gclt30orgt55_slop50.bed

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc15_slop50.bed
#5303959

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc15to20_slop50.bed
#14314103

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc20to25_slop50.bed
#117190134

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc25to30_slop50.bed
#394145286

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc85_slop50.bed
#544746

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc80to85_slop50.bed
#2596229

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc75to80_slop50.bed
#5248507

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc70to75_slop50.bed
#11790933

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc65to70_slop50.bed
#34883854

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc60to65_slop50.bed
#102792311

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc55to60_slop50.bed
#244508502

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gc30to55_slop50.bed
#2164786987

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gclt25orgt65_slop50.bed
#191797009

awk '{ sum+=$3;sum-=$2 } END { print sum }' GRCh38_l100_gclt30orgt55_slop50.bed
#923482821

bgzip GRCh38_l100_gc15_slop50.bed

bgzip GRCh38_l100_gc15to20_slop50.bed

bgzip GRCh38_l100_gc20to25_slop50.bed

bgzip GRCh38_l100_gc25to30_slop50.bed

bgzip GRCh38_l100_gc85_slop50.bed

bgzip GRCh38_l100_gc80to85_slop50.bed

bgzip GRCh38_l100_gc75to80_slop50.bed

bgzip GRCh38_l100_gc70to75_slop50.bed

bgzip GRCh38_l100_gc65to70_slop50.bed

bgzip GRCh38_l100_gc60to65_slop50.bed

bgzip GRCh38_l100_gc55to60_slop50.bed

bgzip GRCh38_l100_gc30to55_slop50.bed

bgzip GRCh38_l100_gclt25orgt65_slop50.bed

bgzip GRCh38_l100_gclt30orgt55_slop50.bed

