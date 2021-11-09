This GRCh38-LowComplexity-README.md file was generated on 20200218 by Justin Zook (revised on 20211022 by Jennifer McDaniel). 

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**\
GRCh38 Low Complexity Stratification BED files

**Principal Investigator:**\
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**\
Justin Zook, NIST, jzook@nist.gov\
Justin Wagener, NIST, justin.wagner@nist.gov

----------------------
Stratification Summary
----------------------
Low Complexity BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium. 

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into regions with different types and sizes of low complexity sequence (e.g., homopolymers, STRs, VNTRs, other locally repetitive sequences). 

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
GRCh38_AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz\
GRCh38_AllTandemRepeats_201to10000bp_slop5.bed.gz\
GRCh38_AllTandemRepeats_51to200bp_slop5.bed.gz\
GRCh38_AllTandemRepeats_gt10000bp_slop5.bed.gz\
GRCh38_AllTandemRepeats_gt100bp_slop5.bed.gz\
GRCh38_AllTandemRepeats_lt51bp_slop5.bed.gz\
GRCh38_AllTandemRepeatsandHomopolymers_slop5.bed.gz\
GRCh38_SimpleRepeat_diTR_11to50_slop5.bed.gz\
GRCh38_SimpleRepeat_diTR_51to200_slop5.bed.gz\
GRCh38_SimpleRepeat_diTR_gt200_slop5.bed.gz\
GRCh38_SimpleRepeat_homopolymer_4to6_slop5.bed.gz\
GRCh38_SimpleRepeat_homopolymer_7to11_slop5.bed.gz\
GRCh38_SimpleRepeat_homopolymer_gt11_slop5.bed.gz\
GRCh38_SimpleRepeat_homopolymer_gt20_slop5.bed.gz\
GRCh38_SimpleRepeat_imperfecthomopolgt10_slop5.bed.gz\
GRCh38_SimpleRepeat_imperfecthomopolgt20_slop5.bed.gz\
GRCh38_SimpleRepeat_quadTR_20to50_slop5.bed.gz\
GRCh38_SimpleRepeat_quadTR_51to200_slop5.bed.gz\
GRCh38_SimpleRepeat_quadTR_gt200_slop5.bed.gz\
GRCh38_SimpleRepeat_triTR_15to50_slop5.bed.gz\
GRCh38_SimpleRepeat_triTR_51to200_slop5.bed.gz\
GRCh38_SimpleRepeat_triTR_gt200_slop5.bed.gz\
GRCh38_notinAllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz\
GRCh38_notinAllTandemRepeatsandHomopolymers_slop5.bed.gz

#### File Descriptions:
All beds have 5bp slop added on each side to capture variants at the edge of the repeats (sometimes insertions were not captured properly before in stratifications).

- `GRCh3X_SimpleRepeat*_slop5.bed.gz`\
perfect repeats of different unit sizes (i.e., homopolymers, and dinucleotide, trinucleotide, and quadnucleotide STRs) and different total repeat lengths (i.e., <=50bp, 51-200bp, or >200bp)
- `GRCh3X_SimpleRepeat_imperfecthomopolgt*_slop5.bed.gz`\
perfect homopolymers >*p as well as imperfect homopolymers where a single base was repeated >10bp except for a 1bp interruption by a different base
- `GRCh3X_AllTandemRepeats_*_slop5.bed.gz`\
union of SimpleRepeat dinucleotide, trinucleotide, and quadnucleotide STRs as well as RepeatMasker_LowComplexity, RepeatMasker_SimpleRepeats, and TRF_SimpleRepeats downloaded from UCSC Genome Browser
- `GRCh3X_AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz`\
union of all perfect homopolymers >6bp and imperfect homopolymers >10bp
- `GRCh3X_AllTandemRepeatsandHomopolymers_slop5.bed.gz`\
union of AllTandemRepeats_* with AllHomopolymers_gt6bp_imperfectgt10bp_slop5.bed.gz
- `GRCh3X_notin*_slop5.bed.gz`\
are non-overlapping complements of the stratification regions (i.e., genome after excluding the regions).

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

To capture the full spectrum of repeats, we used a python script to find exact repeats and UCSC RepeatMasker Low_Complexity, UCSC RepeatMasker Simple_Repeats, and UCSC TRF Low_Complexity.

Beds were generated by `FindSimpleRepeats_GRCh3X_v2.sh`. To create bed files with perfect 1, 2, 3, and 4 bp repeats of lengths, we used the python script `findSimpleRegions_quad.py` (created by Geoff Nilsen, and modified by Justin Zook to output 4-bp repeats).

`notin` complement regions are non-overlapping genomic regions that remain after excluding stratification regions. The genomic reference BED files noted in associated scripts were created manually to include the entirety of each chromosome in each reference and are used to generate `notin` regions. 

`GRCh3X_SimpleRepeat_homopolymer_gt20_slop5.bed.gz` and `GRCh3X_SimpleRepeat_imperfecthomopolgt20_slop5.bed.gz` regions were identified during manual curation of Medically Relevant Gene Benchmark and accounted for a majority of false negatives and false positives for both SNPs and INDELs.  These BED files were generated in `GRCh3X_SimpleRepeat_homopolymer_gt20.sh` and `GRCh3X_SimpleRepeat_imperfecthomoplgt20.sh`using similar methods as were used for the other Low Complexity regions. 

Dependencies: 
UCSC RepeatMasker and TRF_SimpleRepeats downloaded 20190722
- [UCSC RepeatMasker used for UCSC RepeatMasker Low_Complexity and UCSC RepeatMasker Simple_Repeats](hgdownload.cse.ucsc.edu/goldenPath/hg19/database/rmsk.txt.gz)
- [UCSC TRF Low Complexity](hgdownload.cse.ucsc.edu/goldenPath/hg19/database/simpleRepeat.txt.gz)

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged and sorted and only contain chromosomes 1-22, X and Y. A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

#### Quality-Assurance of all files:
Coverage comparison between GRCh37 and GRCh38 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
Geoff Nilsen, Illumina, Inc.

--------------------------
DATA-SPECIFIC INFORMATION 
--------------------------

#### File structure: 
All stratification files are standard 3-field BED files (chromosome, start, end) with header.

#### File naming convention: 
GRCh38_SimpleRepeat_[RepeatUnit]_[TotalRepeatLength]_slopadded.bed.gz

--------------------------
DATA-USE POLICY 
--------------------------

This data/work was created by employees of the National Institute of Standards and Technology (NIST), an agency of the Federal Government. Pursuant to title 17 United States Code Section 105, works of NIST employees are not subject to copyright protection in the United States.  This data/work may be subject to foreign copyright.

The data/work is provided by NIST as a public service and is expressly provided “AS IS.” NIST MAKES NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR STATUTORY, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT AND DATA ACCURACY. NIST does not warrant or make any representations regarding the use of the data or the results thereof, including but not limited to the correctness, accuracy, reliability or usefulness of the data. NIST SHALL NOT BE LIABLE AND YOU HEREBY RELEASE NIST FROM LIABILITY FOR ANY INDIRECT, CONSEQUENTIAL, SPECIAL, OR INCIDENTAL DAMAGES (INCLUDING DAMAGES FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, LOSS OF BUSINESS INFORMATION, AND THE LIKE), WHETHER ARISING IN TORT, CONTRACT, OR OTHERWISE, ARISING FROM OR RELATING TO THE DATA (OR THE USE OF OR INABILITY TO USE THIS DATA), EVEN IF NIST HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

To the extent that NIST may hold copyright in countries other than the United States, you are hereby granted the non-exclusive irrevocable and unconditional right to print, publish, prepare derivative works and distribute the NIST data, in any medium, or authorize others to do so on your behalf, on a royalty-free basis throughout the world.

You may improve, modify, and create derivative works of the data or any portion of the data, and you may copy and distribute such modifications or works. Modified works should carry a notice stating that you changed the data and should note the date and nature of any such change. Please explicitly acknowledge the National Institute of Standards and Technology as the source of the data:  Data citation recommendations are provided at https://www.nist.gov/open/license.

Permission to use this data is contingent upon your acceptance of the terms of this agreement and upon your providing appropriate acknowledgments of NIST’s creation of the data/work.
