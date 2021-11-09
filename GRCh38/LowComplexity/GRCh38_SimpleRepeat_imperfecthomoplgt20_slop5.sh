# Author: Justin Wagner, justin.wager@nist.gov
# Date: September 15, 2020
# Input File Information:
# findSimpleRegions_quad.py is from: https://opendata.nist.gov/pdrsrv/mds2-2190/GRCh38/LowComplexity/findSimpleRegions_quad.py
# Background: This file was generated during development of benchmark for Medically Relevant Genes (GRCh38_HG002_medical_genes_benchmark_generation.ipynb commit 13d6d6c399b92bf33cb7cc39982e11d6080b5019) Perfect homopolymers >20bp as well as imperfect homopolymers where a single base was repeated >20bp except for a 1bp interruption by a different base. 5 bps slop was added on each side of homopolymer. These regions were identified during manual curation of Medically Relevant Gene Benchmark accounting for a majority of false negatives and false positives for both SNPs and INDELs.

python findSimpleRegions_quad.py -p 20 -d 100000 -t 100000 -q 100000 GCA_000001405.15_GRCh38_no_alt_analysis_set.fna GRCh38_SimpleRepeat_p20.bed

sed ‘s/^chr//’ GRCh38_SimpleRepeat_p20.bed | grep “^[0-9XY]” | grep -v ‘_’ | sed ‘s/^X/23/;s/^Y/24/’ | sort -k1,1n -k2,2n -k3,3n | sed ‘s/^23/X/;s/^24/Y/;s/^/chr/’ | bgzip -c > GRCh38_SimpleRepeat_homopolymer_gt20.bed.gz

python findSimpleRegions_quad.py -p 3 -d 100000 -t 100000 -q 100000 GCA_000001405.15_GRCh38_no_alt_analysis_set.fa GRCh38_SimpleRepeat_p3.bed

grep ‘unit=C’ GRCh38_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk ‘$3-$2>20’ > GRCh38_SimpleRepeat_imperfecthomopolgt20_C.bed

grep ‘unit=G’ GRCh38_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk ‘$3-$2>20’ > GRCh38_SimpleRepeat_imperfecthomopolgt20_G.bed

grep ‘unit=A’ GRCh38_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk ‘$3-$2>20’ > GRCh38_SimpleRepeat_imperfecthomopolgt20_A.bed

grep ‘unit=T’ GRCh38_SimpleRepeat_p3.bed | mergeBed -i stdin -d 1 | awk ‘$3-$2>20’ > GRCh38_SimpleRepeat_imperfecthomopolgt20_T.bed

multiIntersectBed -i GRCh38_SimpleRepeat_imperfecthomopolgt20_C.bed \
	GRCh38_SimpleRepeat_imperfecthomopolgt20_G.bed \
	GRCh38_SimpleRepeat_imperfecthomopolgt20_A.bed \
	GRCh38_SimpleRepeat_imperfecthomopolgt20_T.bed |
    sed ‘s/^chr//’ |
    cut -f1-3 | grep “^[0-9XY]” | grep -v ‘_’ |
    sed ‘s/^/chr/’ |
	slopBed -i stdin -b 5 -g human.b38.genome |
    sed ‘s/^chr//’ |
	sed ‘s/^X/23/;s/^Y/24/’ |
	sort -k1,1n -k2,2n -k3,3n |
	sed ‘s/^23/X/;s/^24/Y/;s/^/chr/’ |
	mergeBed -i stdin |
	bgzip -c > GRCh38_SimpleRepeat_imperfecthomopolgt20_slop5.bed.gz