-------------------
POST-PROCESSING SUMMARY
-------------------

Stratification BED files were generated by different people using different methods as detailed in stratification-specific READMEs.  To ensure file consistency all BED files were post-processed.

-------------------
METHODOLOGICAL INFORMATION
-------------------

#### Description of methods used for post-processing:
Shell scripts `GRCh38_stratification_post-processing.sh` and `GRCh37_stratification_post-processing.sh` were run from python notebook `v2.01.00_stratification_post-processing.ipynb`. In summary these scripts performed the following using command line tools and bedtools:
- sort by chromosome and position
- subset to only chromosomes 1-22, X and Y
- merge overlapping regions
- subtract gaps
- remove pseudoautosomal Y regions
- add stratification header
- zip resulted BED file

Files were then renamed from stratification generation output to common naming convention for v3.0 release from within `v2.01.00_stratification_post-processing.ipynb`.  A crosswalk of filenames between generation scripts to final v3.0 release filename can be found in `stratification-file-crosswalk-GRCh37.tsv` and `stratification-file-crosswalk-GRCh38.tsv`.

#### Dependency Files:
The following dependency files are described in `gaps-PSAY-README_3X.txt` 

*Gaps*\
`hg38.README_annotation.md`\
`gap_38_1thruY_sorted_merged.bed`\
`hg19.gap_1thruY_sorted_merged.bed`

*Pseudoautosomal Y*\
`PSA_Y_GRCh38.bed`\
`PSA_Y_GRCh37.bed`

#### Software Dependencies:
[Bedtools v2.30.0](https://bedtools.readthedocs.io/en/latest/)




