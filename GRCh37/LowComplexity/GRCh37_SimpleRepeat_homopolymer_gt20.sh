# Author: Justin Wagner, justin.wager@nist.gov
# Date: November 19, 2020
# Input File Information:
# findSimpleRegions_quad.py is from: https://opendata.nist.gov/pdrsrv/mds2-2190/GRCh38/LowComplexity/findSimpleRegions_quad.py
# Background: This file was generated during development of benchmark for Medically Relevant Genes (GRCh37_HG002_medical_genes_benchmark_generation.ipynb commit 277c664ca867fff3fe0002d34d3d7ed04b64eb04). Regions defined in this file are perfect homopolymers greater than 20 bps with 5 bp added on each side of homopolymer.

python findSimpleRegions_quad.py -p 20 -d 100000 -t 100000 -q 100000 hs37d5.fa GRCh37_SimpleRepeat_p20.bed

cat GRCh37_SimpleRepeat_p20.bed | grep "^[0-9XY]" | grep -v '_' | sed 's/^X/23/;s/^Y/24/' | sort -k1,1n -k2,2n -k3,3n | sed 's/^23/X/;s/^24/Y/' | slopBed -i stdin -b 5 -g human.b37.genome | bgzip -c > GRCh37_SimpleRepeat_homopolymer_gt20_slop5.bed.gz
