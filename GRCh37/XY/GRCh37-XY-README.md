This GRCh37-XY-README.md file was generated on 20220621 by Jennifer McDaniel

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh37 XY BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Justin Zook, NIST, jzook@nist.gov  
Jennifer McDaniel, NIST, jennifer.mcdaniel@nist.gov

----------------------
Stratification Summary
----------------------

XY genomic feature regions were provided by [Melissa Wilson](http://www.sexchrlab.org) from Arizona State University, School of Life Sciences.

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into whether they are in chromosome X and Y specific regions. 

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Public release data are freely available for reuse without embargo.

#### Recommended citations for the data:

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
GRCh37_chrX_PAR.bed.gz  
GRCh37_chrX_XTR.bed.gz  
GRCh37_chrX_ampliconic.bed.gz  
GRCh37_chrX_nonPAR.bed.gz  
GRCh37_chrY_PAR.bed.gz  
GRCh37_chrY_XTR.bed.gz  
GRCh37_chrY_ampliconic.bed.gz  
GRCh37_chrY_nonPAR.bed.gz  
GRCh37_AllAutosomes.bed.gz  


#### File Descriptions:
- `GRCh3X_chr<X/Y>_PAR.bed.gz`  
Homologous sequences on chrX and chrY in recombining regions

- `GRCh3X_chr<X/Y>_XTR.bed.gz` 
X-transposed regions (XTR) outside of PAR in non-recombining regions 

- `GRCh3X_chr<X/Y>_ampliconic.bed.gz`  
Multicopy gene regions

- `GRCh3X_chr<X/Y>_nonPAR.bed.gz`  
All regions of X and Y minus PAR regions. 

- `GRCh3X_AllAutosomes.bed.gz`  
All chromosomes 1-22 only.

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

All XY stratifications files were generated using Linux commands found in `GRCh37-XY.ipynb`

X/Y XTR and ampliconic regions were provided by Melissa Wilson and were parsed from `chr<X/Y>_genomic_features_hg19.bed`

PAR-X stratification regions, `hs37d5.PAR.bed`, was provided by Heng Li.

PAR-Y stratification regions, `PSA_Y_hg19.bed`, are from the USCS Genome Browser. 

Dependencies:  
[chrX_genomic_features_hg19.bed](https://github.com/SexChrLab/SexChrCoordinates/blob/main/hg19/chrX_genomic_features_hg19.bed)  
[chrY_genomic_features_hg19.bed](https://github.com/SexChrLab/SexChrCoordinates/blob/main/hg19/chrY_genomic_features_hg19.bed)  
[PAR-X, hs37d5.PAR.bed, from Heng Li](https://github.com/lh3/dipcall/tree/master/data)  
[PAR-Y, PSA_Y_hg19.bed, regions from UCSC Genome Browser for "Feb 2009 (GRCh37/hg19)" Human Assembly](https://genome.ucsc.edu/cgi-bin/hgGateway)  

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps. The BEDs are merged, sorted and compressed and only contain chromosomes 1-22, X and Y, as appropriate, followed by file compression.  

#### Quality-Assurance of all files:
Coverage comparison between GRCh37, GRCh38 and CHM13v2.0 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the HG002 HPRC.cur.20211005 (trio hifiasm diploid assembly) draft-benchmark to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
[Melissa Wilson](http://www.sexchrlab.org), Arizona State University  

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
