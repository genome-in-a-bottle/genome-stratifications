# genome-stratifications

This repository contains code used to generate the GIAB v2.0 stratification BED files and associated documentation. 
These v2.0 stratification BED files from the Global Alliance for Genomics and 
Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium are 
intended as standard resource of BED files for use in stratifying true positive, 
false positive, and false negative variant calls.

These files can be used as standard resource of BED files for use with GA4GH 
benchmarking tools such as hap.py to stratify.

-------------------
GENERAL INFORMATION
-------------------

Author Information

- Principal Investigator: Justin Zook (jzook@nist.gov)
- Nate Olson (nathanael.olson@nist.gov) 
- Justin Wagner (justin.wagner@nist.gov) 	
- Jennifer McDaniel (Jennifer.mcdaniel@nist.gov) 

Date of data collection : 2015/01/01 - 2020/02/18


--------------------------
SHARING/ACCESS INFORMATION
-------------------------- 

Licenses/restrictions placed on the data, or limitations of reuse: CC0

Recommended citation: 

	Krusche, P., Trigg, L., Boutros, P.C. et al. 
	Best practices for benchmarking germline small-variant calls in human genomes. 
	Nat Biotechnol 37, 555–560 (2019). https://doi.org/10.1038/s41587-019-0054-x


Links to other publicly accessible locations of the data: 

GIAB FTP URL: ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/genome-stratifications/v2.0/
- Individual stratification BED files
- stratification README
- .tsv for benchmarking with hap.py
- MD5 checksums

GitHub URL:  https://github.com/genome-in-a-bottle/genome-stratifications/
- stratification README
- scripts used to generate and evaluate stratification BED files
- .tsv for benchmarking with hap.py
- MD5 checksums

Data.nist.gov DOI: https://doi.org/10.18434/M32190
- Individual stratification BED files
- stratification README
- scripts used to generate and evaluate stratification BED files
- .tsv for benchmarking with hap.py
- MD5 checksums

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

Description of methods used to generate: 
See sub-directory READMEs

Methods for processing the data: 
See sub-directory READMEs for specifics on file generation methodologies.

All v2.0 stratification BED files were post processed processed to remove 
non 1-22, XY chromosomes, remove N regions (specifically gaps and PAR-Y), 
sort and merge regions.  These post processed files were then renamed to create 
the final files in the v2.0-stratification-BEDs directory.  The script for post 
processing can be found in "Prepare Stratification BEDs for GitHub.ipynb"

Quality-assurance procedures: 
Post-processed stratification BED files were validated by chromosome to confirm 
coverage between GRCh37 and GRCh38 was similar and that coverage did not exceed 
that of the reference genome.

