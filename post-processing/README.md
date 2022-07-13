This README file was generated on 20220708 by Jennifer McDaniel.

-------------------
POST-PROCESSING SUMMARY
-------------------

Stratification BED files were generated using different methods as detailed in stratification-specific READMEs.  To ensure file consistency all BED files were post-processed prior to v3.1 release.  Stratifications that were not new or revised for v3.1 were directly carried over from v3.0, no post-processing was performed on those files as they had previously been post-processed. 

-------------------
METHODOLOGICAL INFORMATION
-------------------

#### Description of methods used for post-processing:

Post-processing was run from `v3.1_stratification_post-processing.ipynb` using the `stratification_post-processing.sh` shell script. 

In summary these scripts performed the following, by reference and startifification type, using command line tools and bedtools:

Post-Processing for GRCh3X files included:  
- sort by chromsome and position  
- subset to only chromosomes 1-22, X & Y (removing contig chroms)  
- merge overlaping regions  
- subtract refNs (gaps)  
- remove psuedoautosomal Y regions  (not subtracted for XY stratifications)
- add header to BED giving context for BED  
- compress using bgzip   

Post-Processing for CHM13v2.0 files included:  
- sort by chromsome and position  
- subset to only chromosomes 1-22, X & Y (removing contig chroms)  
- merge overlaping regions  
- No regions, e.g gaps, are removed unlike GRCh3X 
- add header to BED giving context for BED  
- compress using bgzip  

Files were then renamed from stratification generation output to common naming convention for v3.1 release from within `v3.1_stratification_post-processing.ipynb`.  A crosswalk of filenames between generation scripts to final v3.1 release filename can be found in `stratification-file-crosswalk-GRCh37.tsv`, `stratification-file-crosswalk-GRCh38.tsv` and `stratification-file-crosswalk-CHM13v2.0.tsv`.

#### Dependency Files:
The following dependency files are described in `gaps-PSAY-README_3X.txt` 

*Gaps*  
`hg38.README_annotation.md`  
`gap_38_1thruY_sorted_merged.bed`  
`hg19.gap_1thruY_sorted_merged.bed`

*Pseudoautosomal Y*  
`PSA_Y_GRCh38.bed`  
`PSA_Y_GRCh37.bed`  

#### Software Dependencies:
[Bedtools v2.30.0](https://bedtools.readthedocs.io/en/latest/)





