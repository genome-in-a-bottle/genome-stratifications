This GRCh37-OtherDifficult-README.md file was generated on 20200218 by Justin Zook (revised to include new stratifications by Jennifer McDaniel 20211022)

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**\
GRCh37 OtherDifficult BED files

**Principal Investigator:**\
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**\
Justin Zook, NIST, jzook@nist.gov\
Jennifer McDaniel, NIST, jennifer.mcdaniel@nist.gov

----------------------
Stratification Summary
----------------------

Other Difficult Region BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium.

These files are developed to identify miscellaneous difficult regions. These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into whether they are in highly variable regions like the VDJ and MHC, near gaps in the reference, or in errors in the reference.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Publicly release data are freely available for reuse without embargo.

#### Recommended citations for the data:

Reference for KIR stratification:

	Wagner, J. et al.
	Benchmarking challenging small variants with linked and long reads
	Cell Genomics, 11 May 2022, Volume 2, Issue 5, https://doi.org/10.1016/j.xgen.2022.100128

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
GRCh37_KIR.bed.gz  
GRCh37_L1H_gt500.bed.gz  
GRCh37_MHC.bed.gz  
GRCh37_VDJ.bed.gz  
GRCh37_allOtherDifficultregions.bed.gz  
GRCh37_contigs_lt500kb.bed.gz  
GRCh37_gaps_slop15kb.bed.gz  
GRCh37_hg38_minimap2_asm20_N10_gt1contig_gt1kb.bed.gz  
GRCh37_hg38_minimap2_asm20_N10_nocovgt1kb.bed.gz  
GRCh37_hs37d5_decoy_alignments.bed.gz  
GRCh37_missing_and_multiple_alignments_of_GRCh38.bed.gz  

#### File Descriptions:
***Files from GA4GH and GIAB***
- `GRCh37_contigs_lt500kb.bed.gz`  
reference assembly contigs smaller than 500kb
- `GRCh37_gaps_slop15kb.bed.gz`  
 gaps in the reference assembly with 15kb slop 
- `GRCh37_MHC.bed.gz`  
\Major Histocompatibility Complex (including HLA genes), chromosome 6
- `GRCh37_VDJ.bed.gz`  
T cell and B cell VDJ regions that somatically recombine, chromosomes 2, 14 and 22
- `GRCh37_L1H_gt500.bed.gz`  
L1Hs greater than 500 base pairs
- `GRCh37_hs37d5_decoy_alignments.bed.gz`  
 alignments of the hs37d5 decoy sequences to GRCh37, potentially duplicated regions
- `GRCh37_hg38_minimap2_asm20_N10_gt1contig_gt1kb.bed.gz`  
GRCh37 regions covered by >1 contig from GRCh38 using minimap2
- `GRCh37_hg38_minimap2_asm20_N10_nocovgt1kb.bed.gz`  
GRCh37 regions covered by no contigs from GRCh38 using minimap2
- `GRCh37_missing_and_multiple_alignments_of_GRCh38.bed.gz`  
GRCh37 regions covered by >1 contig or no contigs from GRCh38 as defined by GRC as SP or SPonly
- `GRCh37_allOtherDifficultregions.bed.gz`  
union of above regions
- `GRCh37_KIR.bed.gz`  
This region is highly variable in copy number in the population, variant representation is challenging, and mapping-based methods have more errors in this region.

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

Most files were generated in Jupyter notebook `GRCh37_Generating_v4.1_excluded_beds.ipynb`. `GRCh37_allOtherDifficultregions.bed.gz` was generated from the `merge_difficult_regions_GRCh37_2.01.sh`, the `GRCh37_MHC.bed.gz` was generated using conventional coordinates from the Genome Reference Consortium (chr6:28,477,797-33,448,354) and the `GRCh37_KIR.bed.gz` from KIR region coordinates (chr19:55,228,188-55,383,188). 

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged and sorted and only contain chromosomes 1-22, X and Y. A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

#### Quality-Assurance of all files:
Coverage of GRCh37 was performed for each chromosome using R. Where applicable coverage comparisons were made between GRCh37 and GRCh38 BED files. We confirmed coverage was as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
Aaron Wenger, PacBio

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
