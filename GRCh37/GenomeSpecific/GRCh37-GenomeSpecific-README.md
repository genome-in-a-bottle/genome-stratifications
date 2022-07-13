This GRCh37-GenomeSpecific-README.md file was generated on 20211022 by Jennifer McDaniel 

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh37 Genome Specific Stratification BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Justin Zook, NIST, jzook@nist.gov  
Justin Wagner, NIST, justin.wagner@nist.gov  
Jennifer McDaniel, NIST, jennifer.mcdaniel@nist.gov

----------------------
Stratification Summary
----------------------
Genome Specific BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team and the Genome in a Bottle Consortium. 

These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls and were developed to identify difficult regions due to potentially difficult variation in NIST/GIAB sample, including (1) regions containing putative compound heterozygous variants, (2) regions containing multiple variants within 50bp of each other, (3) regions with potential structural variation and copy number variation. 

Note that many stratifications exclude chrX and chrY.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Publicly release data are freely available for reuse without embargo.

#### Recommended citations for the data:

References for stratifications:

	Olson, N. et al.
	precisionFDA Truth Challenge V2: Calling variants from short- and long-reads in difficult-to-map regions
	Cell Genomics, 11 May 2022, Volume 2, Issue 5,  https://doi.org/10.1016/j.xgen.2022.100129
	
	Wagner, J. et al.
	Benchmarking challenging small variants with linked and long reads
	Cell Genomics, 11 May 2022, Volume 2, Issue 5, https://doi.org/10.1016/j.xgen.2022.100128
	
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
***HG001***  
GRCh37_HG001_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG001_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG001_v4.2.1_SV_pbsv_hifiasm_dipcall_svanalyzer_slop25percent.bed.gz  
GRCh37_HG001_v4.2.1_inversions_slop25percent.bed.gz  
GRCh37_HG001_v4.2.1_CNVsandSVs.bed.gz

GRCh37_HG001_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG001_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG001_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG001_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG001_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG001_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG001_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG001_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

***HG002***  
GRCh37_HG002_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG002_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG002_v4.2.1_CNV_gt2assemblycontigs_ONTCanu_ONTFlye_CCSCanu.bed.gz  
GRCh37_HG002_v4.2.1_Tier1plusTier2_v0.6.1.bed.gz  
GRCh37_HG002_v4.2.1_Tier1plusTier2_v0.6.1_slop25percent.bed.gz  
GRCh37_HG002_v4.2.1_inversions_slop25percent.bed.gz  
GRCh37_HG002_v4.2.1_CNVsandSVs.bed.gz

GRCh37_HG002_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG002_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG002_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG002_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG002_hifiasmv0.11_ComplexVar_in_TRgt100.bed.gz  
GRCh37_HG002_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG002_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG002_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG002_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

***HG003***  
GRCh37_HG003_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG003_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG003_v4.2.1_SV_pbsv_slop25percent.bed.gz  
GRCh37_HG003_v4.2.1_CNVsandSVs.bed.gz  

GRCh37_HG003_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG003_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG003_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG003_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG003_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG003_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG003_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG003_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

***HG004***  
GRCh37_HG004_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG004_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG004_v4.2.1_SV_pbsv_slop25percent.bed.gz  
GRCh37_HG004_v4.2.1_CNVsandSVs.bed.gz

GRCh37_HG004_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG004_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG004_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG004_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG004_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG004_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG004_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG004_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

***HG005***  
GRCh37_HG005_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG005_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG005_v4.2.1_SV_pbsv_hifiasm_dipcall_svanalyzer_slop25percent.bed.gz  
GRCh37_HG005_v4.2.1_inversions_slop25percent.bed.gz  
GRCh37_HG005_v4.2.1_CNVsandSVs.bed.gz

GRCh37_HG005_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG005_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG005_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG005_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG005_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG005_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG005_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG005_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

***HG006***  
GRCh37_HG006_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG006_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG006_v4.2.1_SV_pbsv_slop25percent.bed.gz  
GRCh37_HG006_v4.2.1_CNVsandSVs.bed.gz

GRCh37_HG006_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG006_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG006_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG006_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG006_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG006_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG006_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG006_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

***HG007***  
GRCh37_HG007_v4.2.1_CNV_CCSandONT_elliptical_outlier.bed.gz  
GRCh37_HG007_v4.2.1_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz  
GRCh37_HG007_v4.2.1_SV_pbsv_slop25percent.bed.gz  
GRCh37_HG007_v4.2.1_CNVsandSVs.bed.gz

GRCh37_HG007_v4.2.1_comphetindel10bp_slop50.bed.gz  
GRCh37_HG007_v4.2.1_complexindel10bp_slop50.bed.gz  
GRCh37_HG007_v4.2.1_comphetsnp10bp_slop50.bed.gz  
GRCh37_HG007_v4.2.1_snpswithin10bp_slop50.bed.gz  
GRCh37_HG007_v4.2.1_othercomplexwithin10bp_slop50.bed.gz  
GRCh37_HG007_v4.2.1_complexandSVs.bed.gz  
GRCh37_HG007_v4.2.1_complexandSVs_alldifficultregions.bed.gz  
GRCh37_HG007_v4.2.1_notin_complexandSVs_alldifficultregions.bed.gz

#### File Descriptions:
*CNVs and SVs*
- `*inversions_slop25percent.bed.gz`  
putative inversions detected in either haplotype of the trio-hifiasm assembly using svanalyzer, including regions of breakpoint homology, expanded by 25% of the region size on each side
- `*CNV_CCSandONT_elliptical_outlier.bed.gz`  
potential duplications relative to the reference, detected as higher than normal coverage in PacBio CCS and/or ONT
- `*CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection.bed.gz`  
potential duplications relative to the reference, detected as higher than normal coverage in PacBio CCS and/or ONT and as segmental duplications by mrcanavar from Illumina
- `GRCh3X_HG002_v4.2.1_Tier1plusTier2_v0.6.1*.bed.gz`  
Regions containing GIAB HG002 v0.6 Tier1 or Tier2 insertions or deletions >=50bp, expanded to include overlapping tandem repeats, with and without expansion by 25% on each side
- `GRCh3X_HG002_v4.2.1_CNV_gt2assemblycontigs_ONTCanu_ONTFlye_CCSCanu.bed.gz`  
potential duplications relative to the reference, detected as more than 2 contigs aligning in 3 ONT and CCS Trio-binned assemblies of HG002
- `*CNVsandSVs.bed.gz`\
Union of the above genome specific putative CNV and SV bed files used to exclude regions from the v4.2.1 GIAB benchmark

*Complex and Compound Variants*
- `*comphetindel10bp_slop50.bed.gz`  
Regions containing at least one variant on each haplotype within 10bp of each other, and at least one of the variants is an indel, with 50bp slop added on each side
- `*comphetsnp10bp_slop50.bed.gz`  
Regions containing at least one variant on each haplotype within 10bp of each other, and all variants are snps, with 50bp slop added on each side
- `*complexindel10bp_slop50.bed.gz`  
Regions containing at least two variants on one haplotype within 10bp of each other, and at least one of the variants is an indel, with 50bp slop added on each side
- `*complexindel10bp_slop50.bed.gz`  
Regions containing at least two variants on one haplotype within 10bp of each other, and all variants are snps, with 50bp slop added on each side
- `*othercomplexwithin10bp_slop50.bed.gz`  
Any other regions containing at least two variants within 10bp of each other, with 50bp slop added on each side

*Union of CNVs, SVs, Complex and Compound Heterozygous (i.e. multiallelic) Variants*
- `GRCh3X_HG002_hifiasmv0.11_ComplexVar_in_TRgt100.bed.gz`  
represents complex variants in tandem repeats longer than 100 bps in HG002
- `*complexandSVs.bed.gz`  
union of all above SV, CNV, complex and compound heterozygous variant bed files used for v4.2.1 of the GIAB benchmark for each sample
- `*complexandSVs_alldifficultregions.bed.gz`  
Union of GRCh3x_alldifficultregions.bed.gz and complexandSVs.bed for v4.2.1 of the GIAB benchmark for each sample
- `*notin_complexandSVs_alldifficultregions.bed.gz`  
non-overlapping complement of *complexandSVs_alldifficultregions.bed.gz (i.e., genome after excluding the regions).

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

**CNVs and SVs**  
stratifications were generated in genome specific python notebooks:  
- HG001, HG003, HG004, HG005, HG006, HG007 `HG00X_GRCh3X_CNV_exclusion_bed_generation.ipynb`  
- HG002 `GRCh3X_Generating_v4.1_excluded_beds.ipynb`  

The union file `*CNVsandSVs.bed.gz` was generated as part of the Genome Specific snakemake pipeline, `Snakefile` "rule CNVsandSVs" (#7). See pipeline directory for code (`Snakefile`), file dependencies (`Snakefile` and `GRCh3X_HG00X_v4.2.1_GenomeSpecific_config.yaml`) and software (`Snakefile` and environment yaml for bedtools). 

**Complex and Compound Variant**  
stratifications were generated as part of the GenomeSpecific snakemake pipeline, see pipeline directory for code (Snakefile), file dependencies (`Snakefile` and `GRCh3X_HG00X_v4.2.1_GenomeSpecific_config.yaml`) and software (`Snakefile` and environment yamls for bedtools and vcflib). In summary this pipeline uses vcflib vcfgeno2haplo and unix commands to identify complex and compound variants in the v4.2.1 benchmark for all samples. 

**Union of CNVs, SVs, Complex and Compound Heterozygous (i.e. multiallelic) Variant**  
stratifications were generated as part of the GenomeSpecific snakemake pipeline, see pipeline directory for code (Snakefile), file dependencies (`Snakefile` and `GRCh3X_HG00X_v4.2.1_GenomeSpecific_config.yaml`) and software (`Snakefile` and environment yamls for bedtools and vcflib). In summary this pipeline uses vcflib vcfgeno2haplo and unix commands to identify complex and compound variants in the v4.2.1 benchmark for all samples. Union variant files are then generated using bedtools and stratification dependency files listed in associated rules of `Snakefile`.
The `GRCh3X_HG002_hifiasmv0.11_ComplexVar_in_TRgt100.bed.gz` stratification was generated as described in `GRCh3X_HG002__hifiasmv0.11_ComplexVar_in_TRgt100.sh` by intersecting dipcall variant call regions for HG022 Hifiasm_v0.11 assembly with all tandem repeats greater than 100 bps. 
The `GRCh3X_HG002_hifiasmv0.11_ComplexVar_in_TRgt100.bed.gz` stratfication was generated as described in `GRCh3X_HG002__hifiasmv0.11_ComplexVar_in_TRgt100.sh`, tandem repeats longer than 100 bp that contain more than one variant in the HG002 hifiasm v0.11 assembly, which are complex variants that may be represented in different ways.


#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged and sorted and only contain chromosomes 1-22, X and Y. A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

#### Quality-Assurance of all files:
Coverage comparison between GRCh37 and GRCh38 BED files was performed for each chromosome using R. We confirmed coverage between the BEDs were as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
Nancy Hansen, NIH/NCBI

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
