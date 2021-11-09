# Author: Justin Wagner, justin.wager@nist.gov
# Date: August 21, 2020
# Input File Information:
# findSimpleRegions_quad.py is from: https://opendata.nist.gov/pdrsrv/mds2-2190/GRCh38/LowComplexity/findSimpleRegions_quad.py
# Background: This file was generated during development of benchmark for Medically Relevant Genes (GRCh38_HG002_medical_genes_benchmark_generation.ipynb commit 13d6d6c399b92bf33cb7cc39982e11d6080b5019) Regions defined in this file are perfect homopolymers greater than 20 bps with 5 bp added on each side of homopolymer. 

python findSimpleRegions_quad.py -p 20 -d 100000 -t 100000 -q 100000 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna GRCh38_SimpleRepeat_p20.bed

sed ‘s/^chr//’ GRCh38_SimpleRepeat_p20.bed | grep “^[0-9XY]” | grep -v ‘_’ | sed ‘s/^X/23/;s/^Y/24/’ | sort -k1,1n -k2,2n -k3,3n | sed ‘s/^23/X/;s/^24/Y/;s/^/chr/’ | bgzip -c > GRCh38_SimpleRepeat_homopolymer_gt20.bed.gz
