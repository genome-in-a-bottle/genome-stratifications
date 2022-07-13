# Author: Justin Wagner, justin.wagner@nist.gov
# Date: December 4, 2020
# Input file information: 
# HG002v11-align2-GRCh37.dip.vcf was generated by aligning HiFiasm_v0.11 assembly to GRCh37 for HG002 using dipcall (https://github.com/lh3/dipcall).  HiFiasm_v0.11 (https://doi.org/10.1038/s41592-020-01056-5) is a graph-based assembly method using trio data from Heng Li for HiFI long read and trio data. HiFiasm_v0.11 assemblies retrieved from ftp://ftp.dfci.harvard.edu/pub/hli/hifiasm/HG002-trio-v0.11/HG002-v0.11.pat.fa.gz and ftp://ftp.dfci.harvard.edu/pub/hli/hifiasm/HG002-trio-v0.11/HG002-v0.11.mat.fa.gz.
# GRCh37_AllTandemRepeats_gt100bp_slop5.bed is from https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/genome-stratifications/v2.0/GRCh37/LowComplexity/GRCh37_AllTandemRepeats_gt100bp_slop5.bed.gz
# Background: This file was generated during development of benchmark for Medically Relevant Genes (GRCh37_HG002_medical_genes_benchmark_generation.ipynb commit 277c664ca867fff3fe0002d34d3d7ed04b64eb04) and represents complex variants in tandem repeats longer than 100 bps in HG002. 

bedtools intersect -c -a GRCh37_AllTandemRepeats_gt100bp_slop5.bed -b HG002v11-align2-GRCh37.dip.vcf | awk '$4>1' > HG002_GRCh37_MRG_stratification_ComplexVar_in_TR.bed