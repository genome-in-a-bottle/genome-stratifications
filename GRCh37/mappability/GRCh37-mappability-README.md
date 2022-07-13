This GRCh37-mappability-README.md file was generated on 20200219 by Nate Olson (reformatted by Jennifer McDaniel 20211022)

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh37 Mappability Stratification BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Nate D. Olson, NIST, nolson@nist.gov

----------------------
Stratification Summary
----------------------
Mappability BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium. 

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls based on genomic region short read mappability.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Publicly release data are freely available for reuse without embargo.

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
GRCh37_nonunique_l100_m2_e1.bed.gz  
GRCh37_nonunique_l250_m0_e0.bed.gz  
GRCh37_lowmappabilityall.bed.gz  
GRCh37_notinlowmappabilityall.bed.gz  

#### File Descriptions:
"Mappablity" files stratify variant calls based on genomic region short read mappability. These files represent regions with low mappability for two different read lengths and error rates.
 
- `GRCh3X_nonunique_l*_m*_e*.bed.gz` contains only regions that are “low mappability”, meaning they have other homologous regions in the reference genome for the given read length, number of mismatches, and number of indels.	
	* low mappability regions for low stringency parameters:  l100_m2_e1
	* low mappability for high stringency parameters: l250_m0_e0
- `GRCh3X_lowmappabilityall.bed.gz` and `GRCh3X_notinlowmappabilityall.bed.gz` is a union (and non-overlapping complement, "notin") of low and high stringency short read mappability.

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:
Regions with low mappability for different read lengths and error rates were generated using GEM and BEDOPS. The GEM mappability tool finds `l-bp` regions that match other regions in the reference genome with fewer than `m` mismatches (SNPs) and fewer than `e` indels < 15bp. 
We generated mappability files for 100 bp (l100) and 250 bp (l250) single-end reads with the following parameters and stringencies:

- low stringency: l-100, m-2, e-1 (2 mismatches and 1 indels)
- high stringency: l-250, m-0, e-0 (0 mismatches and 0 indels)

The bash script `run_GEM_mappability.sh` was used to generate the raw mappability files and the `make_all_and_notin_beds.sh` script was used to  generate the union stratification (`lowmappabilityall.bed.gz`) and its complement ('notinlowmappabilityall.bed.gz').

#### Dependencies:

- [GRCh37 Genome Reference Sequence](ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/human_g1k_v37.fasta.gz)
  - MD5: 45f81df94f0408d082363e34a081ed81

#### Software:
- GEM mappability program\
[Derrien T, Estellé J, Marco Sola S, Knowles DG, Raineri E, Guigó R, et al. (2012) Fast Computation and Applications of Genome Mappability. PLoS ONE 7(1): e30377](https://doi.org/10.1371/journal.pone.0030377)

	[GEM-binaries-Linux-x86_64-core_i3-20130406-045632](https://sourceforge.net/projects/gemlibrary/files/gem-library/Binary%20pre-release%203/GEM-binaries-Linux-x86_64-core_i3-20130406-045632.tbz2/download)

- BEDOPS genome analysis toolkit\
	[Neph et al. (2012) BEDOPS: high-performance genomic feature operations. Bioinformatics, Volume 28, Issue 14, 15 July 2012, Pages 1919–1920](https://doi.org/10.1093/bioinformatics/bts277)

 	[BEDOPS Binaries](https://bedops.readthedocs.io/en/latest/)

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged and sorted and only contain chromosomes 1-22, X and Y. A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

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

You may improve, modify, and create derivative works of the data or any portion of the data, and you may copy and distribute such modifications or works. Modified works should carry a notice stating that you changed the data and should note the date and nature of any such change. Please explicitly acknowledge the National Institute of Standards and Technology as the source of the data:  Data citation recommendations are provided at https://www.nist.gov/open/license.

Permission to use this data is contingent upon your acceptance of the terms of this agreement and upon your providing appropriate acknowledgments of NIST’s creation of the data/work.
