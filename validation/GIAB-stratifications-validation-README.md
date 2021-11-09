-------------------
VALIDATION SUMMARY
-------------------
Following post-processing, all stratifications were validated for chromosome coverage and stratification functionality in benchmarking.  All stratification coverage and functionality in benchmarking was as expected taking into account nuances of particular stratifications. Output of coverage analysis can be found in `3.0-stratification_validation.html`. 

-------------------
METHODOLOGICAL INFORMATION
-------------------

#### Description of methods used for post-processing:

*Chromosome Coverage*\
Stratification were validated using R (`v3.0-stratification_validation.Rmd`). When possible, coverage comparison between GRCh37 and GRCh38 BED files was performed for each chromosome. We confirmed coverage between (GRCh37 and GRCh38) and within the stratification BEDs was as expected.  Output of the R analysis can be found in `3.0-stratification_validation.html`. 

*Performance in Benchmarking*\
Benchmarking of a HiFi-DeepVariant callset was also performed using v3.0 stratifications with hap.py. The HiFi-DeepVariant callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. Benchmarking using v2.0 stratifications was previously performed for this callset.  Comparison of benchmarking summary statistics between v2.0 and v3.0 stratifications was as expected. 

#### Dependency Files:
Information on genome bed dependency files can be found in `README_for_genome_bed_files`
human.hg38.1_22XY.genome.sorted_noNs_noPSAY_merged.bed
human.b37.1_22XY.genome.sorted_noNs_noPSAY_merged.bed

#### Software Dependencies:
[R v.3.6.3](https://www.r-project.org)\
R packages:\
plyr	v.0.8.5\
forcats	v.0.5.0\
ggplot2	v.3.3.0\
here	v.0.1\
purrr	v.0.3.4\
readr	v.1.3.1\
sessioninfo	v.1.1.1\
stringr	v.1.4.0\
tibble	v.3.0.1\
tidyr	v.1.0.2\
tidyverse	v.1.3.0
 
[hap.py v3.12](https://github.com/Illumina/hap.py)