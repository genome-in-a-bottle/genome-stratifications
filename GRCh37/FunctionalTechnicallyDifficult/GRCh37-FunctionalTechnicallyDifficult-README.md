This GRCh37-FunctionalTechnicallyDifficult-README.md file was generated on 20200224 by Jennifer McDaniel (revised by Jennifer McDaniel 20211022)

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh37 Functional Technically Difficult BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Justin Zook, NIST, jzook@nist.gov  
Justin Wagner, NIST, justin.wager@nist.gov

----------------------
Stratification Summary
----------------------

Functional Technically Difficult BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium.

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into different functional or potentially functional regions that are also likely to be technically difficult to sequence.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Publicly release data are freely available for reuse without embargo.

#### Recommended citations for the data:

Reference for Challenging Medically Relevant Gene (CMRG) stratifications:
 
	Wagner, J. et. al.
	Towards a Comprehensive Variation Benchmark for Challenging Medically-Relevant Autosomal Genes
	BioRxiv (2021) https://doi.org/10.1101/2021.06.07.444885
	
Reference for all other stratifications:

	Olson, N. et al.
	precisionFDA Truth Challenge V2: Calling variants from short- and long-reads in difficult-to-map regions
	Cell Genomics, 11 May 2022, Volume 2, Issue 5,  https://doi.org/10.1016/j.xgen.2022.100129

If stratifications were used in benchmarking with GA4GH/GIAB best practices or hap.py please reference:

	Krusche, P., Trigg, L., Boutros, P.C. et al.
	Best practices for benchmarking germline small-variant calls in human genomes.
	Nat Biotechnol 37, 555–560 (2019). https://doi.org/10.1038/s41587-019-0054-x


#### Links to other publicly accessible locations of the data:

[GIAB FTP URL](https://ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/genome-stratifications/)
- Individual stratification BED files as well as zipped directories (tar.gz) of files
- stratification README
- .tsvs for benchmarking with hap.py
- MD5 checksums

[GitHub URL](https://github.com/genome-in-a-bottle/genome-stratifications/)
- stratification README
- scripts used to generate and evaluate stratification BED files
- .tsvs for benchmarking with hap.py
- MD5 checksums

[Data.nist.gov](https://doi.org/10.18434/mds2-2499)
- Zipped directories (tar.gz) of stratification BED files
- stratification README
- scripts used to generate and evaluate stratification BED files
- .tsv for benchmarking with hap.py
- MD5 checksums

--------------------
DATA & FILE OVERVIEW
--------------------
#### File List:
GRCh37_BadPromoters.bed.gz  
GRCh37_CMRGv1.00_duplicationinKMT2C.bed.gz  
GRCh37_CMRGv1.00_falselyduplicatedgenes.bed.gz

#### File Descriptions:

- `GRCh3X_BadPromoters.bed.gz`  
Identified transcription start sites or first exons that have systematically low coverage as described in ["Characterizing and measuring bias in sequence data"](https://doi.org/10.1186/gb-2013-14-5-r51)

- `GRCh3X_CMRGv1.00_duplicationinKMT2C.bed.gz`  
regions of KMT2C that are duplicated in most or all individuals relative to GRCh37 and GRCh38

- `GRCh3X_CMRGv1.00_falselyduplicatedgenes.bed.gz`  
genes that are falsely duplicated in GRCh37 (MRC1 and part of CNR2) and GRCh38 (CBS, CRYAA, KCNE1, and H19)

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

`GRCh3X_BadPromoters.bed.gz` was generated from the list of [difficult-to-sequence promoters](http://genomebiology.com/content/supplementary/gb-2013-14-5-r51-s1.txt) from the paper ["Characterizing and measuring bias in sequence data"](https://doi.org/10.1186/gb-2013-14-5-r51).  In the paper Ross *et al.* described these regions as:

*Anecdotal results suggested that many transcription start sites or first exons in the human genome tend to have poor coverage. By a systematic analysis of these regions we defined the 1,000 with the lowest relative coverage based on low coverage by an Illumina data set, which we term the 'bad promoters' list (see Materials and methods). The bad promoters are, like many exons, GC-rich (averaging 79% GC composition).*

Falsely duplicated and KMT2C regions were identified during evaluation of the Challenging Medically Relevant Genes Benchmark (CMRG v1.00). From the manual curation of common false positives, false negatives, and genotyping errors, we also identified some categories of variants where the benchmark correctly identified errors in the majority of callsets.  

For `GRCh3X_CMRGv1.00_falselyduplicatedgenes.bed.gz` the script `MRG_falsely_duplicated.sh` was used to extract the falsely duplicated regions from the CMRG benchmark bed. 

`GRCh3X_CMRGv1.00_duplicationinKMT2C.bed.gz` is the region of KMT2C that was identified as being duplicated during CMRG benchmark evaluation. 	 

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.   A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

#### Quality-Assurance of all files:
Coverage comparison between GRCh37 and GRCh38 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. 

--------------------------
DATA-SPECIFIC INFORMATION 
--------------------------

#### File structure: 
All stratification files are standard 3-field BED files (chromosome, start, end) with header.

--------------------------
DATA-USE POLICY 
--------------------------

This data/work was created by employees of the National Institute of Standards and Technology (NIST), an agency of the Federal Government. Pursuant to title 17 United States Code Section 105, works of NIST employees are not subject to copyright protection in the United States.  This data/work may be subject to foreign copyright.

The data/work is provided by NIST as a public service and is expressly provided “AS IS.” NIST MAKES NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR STATUTORY, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT AND DATA ACCURACY. NIST does not warrant or make any representations regarding the use of the data or the results thereof, including but not limited to the correctness, accuracy, reliability or usefulness of the data. NIST SHALL NOT BE LIABLE AND YOU HEREBY RELEASE NIST FROM LIABILITY FOR ANY INDIRECT, CONSEQUENTIAL, SPECIAL, OR INCIDENTAL DAMAGES (INCLUDING DAMAGES FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, LOSS OF BUSINESS INFORMATION, AND THE LIKE), WHETHER ARISING IN TORT, CONTRACT, OR OTHERWISE, ARISING FROM OR RELATING TO THE DATA (OR THE USE OF OR INABILITY TO USE THIS DATA), EVEN IF NIST HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

To the extent that NIST may hold copyright in countries other than the United States, you are hereby granted the non-exclusive irrevocable and unconditional right to print, publish, prepare derivative works and distribute the NIST data, in any medium, or authorize others to do so on your behalf, on a royalty-free basis throughout the world.

You may improve, modify, and create derivative works of the data or any portion of the data, and you may copy and distribute such modifications or works. Modified works should carry a notice stating that you changed the data and should note the date and nature of any such change. Please explicitly acknowledge the National Institute of Standards and Technology as the source of the data:  Data citation recommendations are provided at [here](https://www.nist.gov/open/license).

Permission to use this data is contingent upon your acceptance of the terms of this agreement and upon your providing appropriate acknowledgments of NIST’s creation of the data/work.
