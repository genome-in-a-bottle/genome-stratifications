This README file was generated on 20220708 by Jennifer McDaniel.

-------------------
VALIDATION SUMMARY
-------------------
Following post-processing, all stratifications were validated for chromosome coverage and stratification functionality in benchmarking.  All stratification coverage and functionality in benchmarking was as expected taking into account nuances of particular stratifications. Output of coverage analysis can be found in `v3.1-stratification_validation.html`. 

-------------------
METHODOLOGICAL INFORMATION
-------------------

#### Description of methods used for post-processing:

**Chromosome Coverage**\
Stratification files were validated using R (`v3.1-stratification_validation.Rmd`). When possible, coverage comparison between GRCh37, GRCh38 and CHM13v2.0 BED files was performed for each chromosome. We confirmed coverage , between and within references, in stratifications were as expected.  Output of the R analysis can be found in `v3.1-stratification_validation.html`. 

**Performance in Benchmarking**\
Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the HG002 HPRC.cur.20211005 (trio hifiasm diploid assembly) draft-benchmark to ensure benchmarking statistics in these regions were as expected. Summary benchmarking metrics and plots can be found in the following locations:    

Summary Benchmarking metrics for all benchmarking runs and stratifications
- `v3.1-strat-eval_benchmarking-summary-stats_070622.csv` generated with `v3.1_benchmarking_summary_metrics_for_all_stratification_evaluation.R`  

Summary metric plots by reference for subset of stratifications 
- `v3.1-stratfication-summary-plots.html`

A summary of all benchmarking validation issues and resolutions can be found in `v3.1-benchmarking-eval-notes.docx`  

#### Dependency Files:
Information on genome bed dependency files can be found in `Generate-Genome-Bed-Files-For-Validation.ipynb`  
`GRCh37_1-22XY_sorted_NoNs_NoPSAY_merged.genome.bed`   
`GRCh38_1-22XY_sorted_NoNs_NoPSAY_merged.genome.bed`  
`CHM13v2.0_1-22XY_sorted.genome.bed`

#### Software Dependencies:
[R v.3.6.3](https://www.r-project.org)  
R packages:  
plyr	v.0.8.5  
forcats	v.0.5.0  
ggplot2	v.3.3.0  
here	v.0.1  
purrr	v.0.3.4  
readr	v.1.3.1  
sessioninfo	v.1.1.1  
stringr	v.1.4.0  
tibble	v.3.0.1  
tidyr	v.1.0.2  
tidyverse	v.1.3.0  
 
[hap.py v3.15](https://github.com/Illumina/hap.py)