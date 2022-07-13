This GRCh38-Union-README.md file was generated on 20200218 by Justin Zook (revised by Jennifer McDaniel 20220621)

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh38 Union BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Justin Zook, NIST, jzook@nist.gov  
Jennifer McDaniel, NIST, jennifer.mcdaniel@nist.gov

----------------------
Stratification Summary
----------------------

Union BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team, the [Genome in a Bottle Consortium](https://www.nist.gov/programs-projects/genome-bottle) and the [T2T Consortium](https://sites.google.com/ucsc.edu/t2tworkinggroup).

These files are developed by taking the union of the more granular difficult regions bed files. These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into whether they are in or not in different general types of difficult regions or in any type of difficult region or complex variant. For example, performance can be measured in just the "easy" regions of the genome.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Public release data are freely available for reuse without embargo.

#### Recommended citations for the data:

Reference for stratifications from T2T consortium:

	Aganezov, S. et al.
	A complete reference genome improves analysis of human genetic variation
	SCIENCE, 1 Apr 2022 Vol 376, Issue 6588, https://doi.org/10.1126/science.abl3533

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
GRCh38_alldifficultregions.bed.gz  
GRCh38_notinalldifficultregions.bed.gz  
GRCh38_alllowmapandsegdupregions.bed.gz    
GRCh38_notinalllowmapandsegdupregions.bed.gz   

#### File Descriptions:
- `GRCh3X_alldifficultregions.bed.gz`  
union of all tandem repeats, all homopolymers >6bp, all imperfect homopolymers >10bp, all difficult to map regions, all segmental duplications, GC <25% or >65%, "Bad Promoters", chrX/Y XTR and ampliconic, satellites and "OtherDifficult" regions (including regions from the T2T-consortium for GRCh38 only)
 
- `GRCh3X_alllowmapandsegdupregions.bed.gz`  
union of all difficult to map regions and all segmental duplications

- `notin`  
complement regions are non-overlapping genomic regions that remain after excluding stratification regions.  

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

Union stratifications were generated using [bedtools](https://bedtools.readthedocs.io/en/latest/) multiIntersectBed, sortBed, mergeBed and subtractBed. 

`GRCh3X_alllowmapandsegdupregions.bed.gz` is a union of low mappability regions and segmental duplications. This, and complement "notin", were generated using `merge_difficult_regions_GRCh3X_2.01.sh`.  

All other "Union" stratifications files were generated in `GRCh38-Union.ipynb`

Dependencies:  

Information on input files can be found in READMEs for the following stratification types:
- OtherDifficult
- Mappability
- GCcontent
- LowComplexity
- SegDups
- FunctionalTechnicallyDifficult
- XY

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged, sorted and compressed and only contain chromosomes 1-22, X and Y.  

#### Quality-Assurance of all files:
Coverage comparison between GRCh37, GRCh38 and CHM13v2.0 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the HG002 HPRC.cur.20211005 (trio hifiasm diploid assembly) draft-benchmark to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
[Melissa Wilson](http://www.sexchrlab.org), Arizona State University  
[T2T Consortium](https://sites.google.com/ucsc.edu/t2tworkinggroup)

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
