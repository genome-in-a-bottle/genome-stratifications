This GRCh38-SegDups-README.md file was generated on 20200219 by Jennifer McDaniel (revised on 20220706 by Jennifer McDaniel).
-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh38 Segmental Duplications Stratification BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Justin Zook, NIST, jzook@nist.gov  
Jennifer McDaniel, NIST, jennifer.mcdaniel@nist.gov

----------------------
Stratification Summary
----------------------
Segmental Duplication BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium. 

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into whether they are in segmental duplications or in regions with non-trivial self-chain alignments.

**IMPORTANT NOTE REGARDING UCSC chainSelf**  
There were substantial differences between the self chains downloaded for GRCh37 and GRCh38, which we do not fully understand, so we recommend using these with care  For this reason the self chain files were not used in preparation of union files.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Public release data are freely available for reuse without embargo.

#### Recommended citations for the data:

Reference for stratifications:

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
GRCh38_chainSelf.bed.gz  
GRCh38_chainSelf_gt10kb.bed.gz  
GRCh38_gt5segdups_gt10kb_gt99percidentity.bed.gz  
GRCh38_notinchainSelf.bed.gz  
GRCh38_notinchainSelf_gt10kb.bed.gz  
GRCh38_notinsegdups.bed.gz  
GRCh38_notinsegdups_gt10kb.bed.gz  
GRCh38_segdups.bed.gz  
GRCh38_segdups_gt10kb.bed.gz  

#### File Descriptions:
- `GRCh3X_chainSelf.bed.gz`  
Describes non-trivial alignments of the genome reference to itself (excluding ALT loci). Non-trivial self-chains are regions where another part of the genome aligns to it because the sequences are similar (e.g., due to genomic duplication events). Further information on UCSC tracks can be found at https://genome.ucsc.edu/cgi-bin/hgTables.

- `GRCh3X_segdups.bed.gz`  
The UCSC genomicSuperDups file was processed to remove all but chromosomes 1-22, X and Y and overlapping regions merged. 

- `GRCh3X_chainSelf_gt10kb.bed.gz` and `GRCh3X_segdups_gt10kb.bed.gz`  
are the `GRCh3X_chainSelf.bed.gz` and `GRCh3X_segdups.bed.gz` files filtered to regions greater than 10kb. 

- `GRCh3X_gt5segdups_gt10kb_gt99percidentity.bed.gz`  
We further subset to regions >10kb covered by more than 5 segmental duplications with >99% identity in GRCh3X_gt5segdups_gt10kb_gt99percidentity.bed.gz

- `notin`  
are non-overlapping complements of the stratification regions (i.e., genome after excluding the regions).

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:
These files are derived from the UCSC hg38 chainSelf, chainSelfLink and genomicSuperDups genome tracks.  

*Self Chain*  
The chainSelf and chainSelfLink files were retrieved from the UCSC golden path. To generate a self chain bed that describes non-trivial alignments of the genome reference to itself (excluding ALT loci), we used both the chainSelf and chainSelfLink files from UCSC, matching the IDs in the two files and only using the regions with base-level alignments (i.e., excluding gaps between chained alignments). We then merged overlapping regions and regions separated by <100bp.  An additional self chain output was filtered to yield only regions that are greater than 10kb.
PAR-X regions in chainSelf file is improperly annotated and was subtracted with bedtools.

*Segmental Duplications*  
The genomicSuperDups file was processed to remove all but chromosomes 1-22, X and Y and overlapping regions merged using bedtools An additional segmental duplication output was filtered to yield only regions that are greater than 10kb. We further subset to regions >10kb covered by more than 5 segmental duplications with >99% identity in GRCh3X_gt5segdups_gt10kb_gt99percidentity.bed.gz

The self-chain and segdups stratification BEDs were generated from UCSC input files and processed as described in scripts. Scripts for generating `GRCh38_gt5segdups_gt10kb_gt99percidentity.bed.gz` are in `GRCh38_Generating_v4.1_excluded_beds.ipynb`. Scripts for generating all other self-chain and segdup BEDs are in `GRCh38_new_chainSelf_and_Segdups.ipynb`.  During generation of v3.1 stratifications it was found that PAR-X regions were incorrectly annotated in the chainself regions.  PAR-X was removed from all chainself stratifications in` GRCh38-SegmentalDuplications-v3.1_updated_selfchains.ipynb`. PAR-X from Heng Li, that is used with [dipcall (hs38.PAR.bed)](https://github.com/lh3/dipcall/tree/master/data)

`notin` complement regions are non-overlapping genomic regions that remain after excluding stratification regions. The genomic reference BED files noted in associated scripts were created manually to include the entirety of each chromosome in each reference and are used to generate `notin` regions. 


- [UCSC GRCh38 chainself.txt.gz](hgdownload.cse.ucsc.edu/goldenPath/hg38/database/chainSelf.txt.gz)
- [UCSC GRCh38 chainselflink.txt.gz](hgdownload.cse.ucsc.edu/goldenPath/hg38/database/chainSelfLink.txt.gz)
- [UCSC GRCH38 genomicSuperDups.txt.gz](hgdownload.cse.ucsc.edu/goldenPath/hg38/database/genomicSuperDups.txt.gz)
- [GRCh38 PAR-X regions, `hs38.PAR.bed`](https://github.com/lh3/dipcall/tree/master/data)

#### Software:

- [BEDTOOLS](https://bedtools.readthedocs.io/en/latest/)

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged, sorted and compressed and only contain chromosomes 1-22, X and Y.  

#### Quality-Assurance of all files:
Coverage comparison between GRCh37, GRCh38 and CHM13v2.0 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the HG002 HPRC.cur.20211005 (trio hifiasm diploid assembly) draft-benchmark to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
Aaron Wegner (PacBio) contributed scripts for generating self chain files from UCSC inputs.

Heng Li (Department of Data Sciences, Dana-Farber Cancer Institute, Boston, MA, USA and Department of Biomedical Informatics, Harvard Medical School, Boston, MA, USA) contributed PAR-X regions.

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

You may improve, modify, and create derivative works of the data or any portion of the data, and you may copy and distribute such modifications or works. Modified works should carry a notice stating that you changed the data and should note the date and nature of any such change. Please explicitly acknowledge the National Institute of Standards and Technology as the source of the data:  Data citation recommendations are provided at https://www.nist.gov/open/license.

Permission to use this data is contingent upon your acceptance of the terms of this agreement and upon your providing appropriate acknowledgments of NIST’s creation of the data/work.
