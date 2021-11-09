This GRCh37-GCcontent-README.md file was generated on 20200224 by Jennifer McDaniel (reformatted by JMcDaniel on 20211022).

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**\
GRCh37 GC Content Stratification BED files

**Principal Investigator:**\
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**\
Justin Zook, NIST, jzook@nist.gov\

----------------------
Stratification Summary
----------------------
GC Content BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium. 

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into different ranges of GC content.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Publicly release data are freely available for reuse without embargo.


#### Recommended citations for the data:

Reference for stratifications:

	Olson, N. et al.
	precisionFDA Truth Challenge V2: Calling variants from short- and long-reads in difficult-to-map regions
	BioRxiv (2021) https://doi.org/10.1101/2020.11.13.380741

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
GRCh37_gc15_slop50.bed.gz\
GRCh37_gc15to20_slop50.bed.gz\
GRCh37_gc20to25_slop50.bed.gz\
GRCh37_gc25to30_slop50.bed.gz\
GRCh37_gc30to55_slop50.bed.gz\
GRCh37_gc55to60_slop50.bed.gz\
GRCh37_gc60to65_slop50.bed.gz\
GRCh37_gc65to70_slop50.bed.gz\
GRCh37_gc70to75_slop50.bed.gz\
GRCh37_gc75to80_slop50.bed.gz\
GRCh37_gc80to85_slop50.bed.gz\
GRCh37_gc85_slop50.bed.gz\
GRCh37_gclt25orgt65_slop50.bed.gz\
GRCh37_gclt30orgt55_slop50.bed.gz

#### File Descriptions:
GC content stratifications were created to stratify variants into different ranges(%) of GC content. 
- `GRCh3X_gc15_slop50.bed.gz`\
are regions where GC content is less than 15%
- `GRCh3X_gc85_slop50.bed.gz`\
are regions where GC content is greater than 85%
- `GRCh3X_gcxxtoyy_slop50.bed.gz`\
are regions where GC content is between xx% and yy%
- `GRCh3X_gclt*orgt*_slop50.bed.gz`\
are regions where GC content is less than some percentage (`gclt`) or greater than some percentage (`orgt`).

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:
These files were created by Justin Zook at the National Institute of Standards and Technology based on discussions in the GA4GH Benchmarking Team using Heng Li’s seqtk algorithm (https://github.com/lh3/seqtk).  This identifies >=x bp regions with >y% or <y% GC. The last column in the output BED gives how many G/C bases in each identified region. This algorithm automatically seeks the boundaries of high-GC regions.  As [Heng Li describes](https://groups.google.com/d/msgid/ga4gh-dwg-benchmarking/CAPipXk%2B4PCKE-AfxuKw5bLtJC0MgoamDiyE-bcJNUJCXvtZX6A%40mail.gmail.com): 

*For example, we give a score s(C)=s(G)=1 and s(A)=s(T)=-2. Let f(i) be the accumulative score at chr position i, which is computed by f(i)=f(i-1)+s(i) if f(i-1)+s(i) is positive; or zero otherwise. We move forwardly to find local maxima of f(i). These are the right boundaries of a high-GC regions. We then move backwardly from each local maximum to find the left boundaries. Under this scoring, identified segments must have a %GC above 2/(1+2)=67%. Phred and bwa trimming are both based on a similar idea.”   To generate these files, we used the GRCh37 fasta from 1000genomes.org without decoy sequences (`human_g1k_v37.fasta`).*

The process used to generate these regions was:
1.  First generate regions with <15, 20, 25, and 30% GC and >55, 60, 65, 70, 75, 80, and 85 % GC
2.  Expand by 50bp on each side to get "200 bp regions in which the middle 100bp contains <x% or >x% GC", based on doi:10.1186/gb-2013-14-5-r51
3.  Subtract more stringent bed from less stringent bed to get GC content ranges
4.  Everything else goes in 30to65 bed file for moderate GC (this range was chosen based on where coverage starts decreasing or error rates start increasing for any technology in doi:10.1186/gb-2013-14-5-r51
5.  Note that after adding 50bp slop, 272336 bp overlap between gc30 and gc65, or 0.07% of gc30 and 0.5% of gc65, so the bed files with different GC ranges are almost exclusive of each other, but not completely

We chose to stratify regions with <30% or >55% GC because these regions had decreased coverage or higher error rates for at least one of the technologies in doi:10.1186/gb-2013-14-5-r51, and we added 55-60 and 60-65 because we found increased error rates in these tranches in exploratory work.

The shell script used to generate GC content stratification was `seqtk_gc.sh`.

#### Dependencies:
[GRCh37 fasta from 1000genomes.org without decoy sequences `human_g1k_v37.fasta.gz`](http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz)

#### Software:

- [BEDTOOLS](https://bedtools.readthedocs.io/en/latest/)
- [Seqtk version 5e1e8dbd506ea1ff8c77d468a1f27b8e8f73eac0 downloaded 3/30/15](https://github.com/lh3/seqtk)
- [Tabix version-1.9 from samtools](https://www.htslib.org)

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged and sorted and only contain chromosomes 1-22, X and Y. A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

#### Quality-Assurance of all files:
Coverage comparison between GRCh37 and GRCh38 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
Heng Li, Department of Data Sciences, Dana-Farber Cancer Institute, Boston, MA, USA

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
