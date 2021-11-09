# Author: Justin Wagner, justin.wager@nist.gov
# Date: November 19, 2020
# Input File Information:
# findSimpleRegions_quad.py is from: https://opendata.nist.gov/pdrsrv/mds2-2190/GRCh38/LowComplexity/findSimpleRegions_quad.py
# Background: This file was generated during development of benchmark for Medically Relevant Genes (GRCh37_HG002_medical_genes_benchmark_generation.ipynb commit 277c664ca867fff3fe0002d34d3d7ed04b64eb04). Perfect homopolymers >20bp as well as imperfect homopolymers where a single base was repeated >20bp except for a 1bp interruption by a different base. 5 bps slop was added on each side of homopolymer.  These regions were identified during manual curation of Medically Relevant Gene Benchmark accounting for a majority of false negatives and false positives for both SNPs and INDELs.

python findSimpleRegions_quad.py -p 3 -d 100000 -t 100000 -q 100000 hs37d5.fa GRCh37_SimpleRepeat_p3.bed

grep 'unit=C' GRCh37_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk '$3-$2>20' > GRCh37_SimpleRepeat_imperfecthomopolgt20_C.bed
grep 'unit=G' GRCh37_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk '$3-$2>20' > GRCh37_SimpleRepeat_imperfecthomopolgt20_G.bed
grep 'unit=A' GRCh37_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk '$3-$2>20' > GRCh37_SimpleRepeat_imperfecthomopolgt20_A.bed
grep 'unit=T' GRCh37_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk '$3-$2>20' > GRCh37_SimpleRepeat_imperfecthomopolgt20_T.bed
multiIntersectBed -i GRCh37_SimpleRepeat_imperfecthomopolgt20_C.bed \
	GRCh37_SimpleRepeat_imperfecthomopolgt20_G.bed \
	GRCh37_SimpleRepeat_imperfecthomopolgt20_A.bed \
	GRCh37_SimpleRepeat_imperfecthomopolgt20_T.bed | 
    cut -f1-3 | grep "^[0-9XY]" | grep -v '_' |
	slopBed -i stdin -b 5 -g human.b37.genome |
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n -k3,3n | 
	sed 's/^23/X/;s/^24/Y/' | 
	mergeBed -i stdin | 
	bgzip -c > GRCh37_SimpleRepeat_imperfecthomopolgt20_slop5.bed.gz