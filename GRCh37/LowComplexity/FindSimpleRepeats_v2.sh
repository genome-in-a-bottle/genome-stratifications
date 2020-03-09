#!/bin/sh

#  FindSimpleRepeats.sh
#  
#
#  Created by Zook, Justin on 3/30/15.
#  Updated by Zook, Justin on 7/10/19 to fix lengths of homopolymers, add 5bp slop to all beds, remove slop 10 from homopolymergt10,  increase TR cutoff to at least 5x unit length, and add UCSC RepeatMasker and TRF instead of TRDB

if [ 0 -gt 1 ]; then

#homopolymers
python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 3 -d 100000 -t 100000 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 6 -d 100000 -t 100000 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p6.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 11 -d 100000 -t 100000 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p11.bed 

#dinuc repeats
python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 11 -t 100000 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d11.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 51 -t 100000 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d51.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 201 -t 100000 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d201.bed 

#trinuc repeats
python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 100000 -t 15 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t15.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 100000 -t 51 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t51.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 100000 -t 201 -q 100000 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t201.bed 

#quadnuc repeats
python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 100000 -t 100000 -q 20 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q20.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 100000 -t 100000 -q 51 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q51.bed &

python /Volumes/DroboZook/bioinfo/forJustin7Nov12/findSimpleRegions_quad.py -p 100000 -d 100000 -t 100000 -q 201 /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q201.bed 

#find ranges of repeats
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p6.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_4to6.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p6.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p11.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_7to11.bed.gz
grep "^[0-9XY]" /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p11.bed | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_gt11.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d11.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d51.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_11to50.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d51.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d201.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_51to200.bed.gz
grep "^[0-9XY]" /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_d201.bed | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_gt200.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t15.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t51.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_15to50.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t51.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t201.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_51to200.bed.gz
grep "^[0-9XY]" /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_t201.bed | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_gt200.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q20.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q51.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_20to50.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q51.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q201.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_51to200.bed.gz
grep "^[0-9XY]" /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_q201.bed | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_gt200.bed.gz

#Add 5bp slop on either side of repeats to ensure insertions at the edge of the repeat and any adjacent repetitive structures are captured
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_4to6.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_homopolymer_4to6_slop5.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_7to11.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_homopolymer_7to11_slop5.bed.gz 
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_gt11.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_homopolymer_gt11_slop5.bed.gz 
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_11to50.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_diTR_11to50_slop5.bed.gz 
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_51to200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_diTR_51to200_slop5.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_gt200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_diTR_gt200_slop5.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_15to50.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_triTR_15to50_slop5.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_51to200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_triTR_51to200_slop5.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_gt200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_triTR_gt200_slop5.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_20to50.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_quadTR_20to50_slop5.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_51to200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_quadTR_51to200_slop5.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_gt200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_quadTR_gt200_slop5.bed.gz

#Make 3 column versions so that hap.py doesn't perform more granular stratifications
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_4to6.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_homopolymer_4to6_slop5_3col.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_7to11.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_homopolymer_7to11_slop5_3col.bed.gz 
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_homopolymer_gt11.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_homopolymer_gt11_slop5_3col.bed.gz 
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_11to50.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_diTR_11to50_slop5_3col.bed.gz 
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_51to200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_diTR_51to200_slop5_3col.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_gt200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_diTR_gt200_slop5_3col.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_15to50.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_triTR_15to50_slop5_3col.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_51to200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_triTR_51to200_slop5_3col.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_gt200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_triTR_gt200_slop5_3col.bed.gz &
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_20to50.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_quadTR_20to50_slop5_3col.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_51to200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_quadTR_51to200_slop5_3col.bed.gz
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_gt200.bed.gz -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome | cut -f1-3 | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c  > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_quadTR_gt200_slop5_3col.bed.gz

#Find imperfect (and perfect) homopolymers >10bp by merging homopolymers >=4bp separated by 1bp. Also, add 5bp padding on both sides to include errors around edges
#/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed -d 1 | awk '{if($3-$2>10) print}' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/DroboZook/bioinfo/BEDTools-Version-2.16.2/genomes/human.b37.genome | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_imperfecthomopolgt10_slop5.bed.gz
grep 'unit=C' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 1 | awk '$3-$2>10' > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_C.bed
grep 'unit=G' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 1 | awk '$3-$2>10' > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_G.bed
grep 'unit=A' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 1 | awk '$3-$2>10' > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_A.bed
grep 'unit=T' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p3.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 1 | awk '$3-$2>10' > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_T.bed
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_C.bed \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_G.bed \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_A.bed \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_imperfecthomopolgt10_T.bed | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_imperfecthomopolgt10_slop5.bed.gz

#get repeats from UCSC RepeatMasker and TRF/Low Complexity files
#rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/rmsk.txt.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/
zgrep Simple_repeat /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk.txt.gz |
    awk '{ print $6 "\t" $7 "\t" $8 ; }' |
    sed 's/^chr//' |
    grep "^[0-9XY]" | grep -v '_' |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat.bed.gz |
	awk '$3-$2<51' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_lt51.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat.bed.gz |
	awk '$3-$2>50 && $3-$2<201' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_51to200.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat.bed.gz |
	awk '$3-$2>200' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_gt200.bed.gz
zgrep Low_complexity /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk.txt.gz |
    awk '{ print $6 "\t" $7 "\t" $8 ; }' |
    sed 's/^chr//' |
    grep "^[0-9XY]" | grep -v '_' |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
    /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity.bed.gz |
	awk '$3-$2<51' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_lt51.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity.bed.gz |
	awk '$3-$2>50 && $3-$2<201' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_51to200.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity.bed.gz |
	awk '$3-$2>200' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_gt200.bed.gz

#rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/simpleRepeat.txt.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/simpleRepeat.txt.gz |
    cut -f2-4 |
    sed 's/^chr//' |
    grep "^[0-9XY]" | grep -v '_' |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
    /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat.bed.gz |
	awk '$3-$2<51' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_lt51.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat.bed.gz |
	awk '$3-$2>50 && $3-$2<201' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_51to200.bed.gz
gunzip -c /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat.bed.gz |
	awk '$3-$2>200' | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_gt200.bed.gz
fi
#Merge all homopolymers and find complement
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_p6.bed -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i stdin /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/SimpleRepeat_imperfecthomopolgt10_slop5.bed.gz |
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/notinAllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz

#Merge exact repeats and UCSC repeats bed files and subtract homopolymers
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_11to50.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_15to50.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_20to50.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_lt51.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_lt51.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_lt51.bed.gz | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_lt51bp_slop5.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_51to200.bed.gz | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_51to200bp_slop5.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_51to200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_gt200.bed.gz | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
    awk '$3-$2>110' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_gt100bp_slop5.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_gt200.bed.gz | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	awk '$3-$2<10000' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_201to10000bp_slop5.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_diTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_triTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/SimpleRepeat_quadTR_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Simple_repeat_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/rmsk_Low_complexity_gt200.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/trf_simpleRepeat_gt200.bed.gz | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/slopBed -i stdin -b 5 -g /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	awk '$3-$2>=10000' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_gt10000bp_slop5.bed.gz

#Merge all homopolymers and TRs and find complement
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_lt51bp_slop5.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_51to200bp_slop5.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_201to10000bp_slop5.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeats_gt10000bp_slop5.bed.gz \
	/Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | 
	/Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeatsandHomopolymers_slop5.bed.gz

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/intermediatefiles/human.b37.genome.bed -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/AllTandemRepeatsandHomopolymers_slop5.bed.gz | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/LowComplexity/notinAllTandemRepeatsandHomopolymers_slop5.bed.gz
