This GRCh38-OtherDifficult-README.md file was generated on 20200218 by Justin Zook (revised to include new stratifications by Jennifer McDaniel 20211022)

-------------------
GENERAL INFORMATION
-------------------

**Title of Dataset:**  
GRCh38 OtherDifficult BED files

**Principal Investigator:**  
Justin Zook, NIST, jzook@nist.gov
	
**Dataset Contact(s):**  
Justin Zook, NIST, jzook@nist.gov  
Jennifer McDaniel, NIST, jennifer.mcdaniel@nist.gov

----------------------
Stratification Summary
----------------------

Other Difficult Region BED files are from the Global Alliance for Genomics and Health (GA4GH) Benchmarking Team. the Genome in a Bottle Consortium and the [T2T Consortium](https://sites.google.com/ucsc.edu/t2tworkinggroup).

These files are developed to identify miscellaneous difficult regions. These files can be used as standard resource of BED files for use with GA4GH benchmarking tools such as [hap.py](https://github.com/Illumina/hap.py) to stratify true positive, false positive, and false negative variant calls into whether they are in highly variable regions like the VDJ and MHC, near gaps in the reference, or in errors in the reference.

--------------------------
SHARING/ACCESS INFORMATION
--------------------------

#### Licenses/restrictions placed on the data, or limitations of reuse: 
Publicly release data are freely available for reuse without embargo.

#### Recommended citations for the data:

Reference for stratifications from T2T consortium:

	Aganezov, S. et al.
	A complete reference genome improves analysis of human genetic variation
	SCIENCE, 1 Apr 2022 Vol 376, Issue 6588, https://doi.org/10.1126/science.abl3533

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
GRCh38_KIR.bed.gz  
GRCh38_collapsed_duplication_FP_regions.bed.gz  
GRCh38_population_CNV_FP_regions.bed.gz  
GRCh38_false_duplications_correct_copy.bed.gz  
GRCh38_false_duplications_incorrect_copy.bed.gz  
GRCh38_LD_discordant_haplotypes_slop5bp.bed.gz  
GRCh38_gnomAD_InbreedingCoeff_slop1bp_merge1000bp.bed.gz  
GRCh38_L1H_gt500.bed.gz  
GRCh38_MHC.bed.gz  
GRCh38_VDJ.bed.gz  
GRCh38_contigs_lt500kb.bed.gz  
GRCh38_gaps_slop15kb.bed.gz  
GRCh38_allOtherDifficultregions.bed.gz  

#### File Descriptions:
***Files from GA4GH and GIAB***
- `GRCh38_contigs_lt500kb.bed.gz`  
reference assembly contigs smaller than 500kb
- `GRCh38_gaps_slop15kb.bed.gz`  
 gaps in the reference assembly with 15kb slop 
- `GRCh38_MHC.bed.gz`  
Major Histocompatibility Complex (including HLA genes), chromosome 6
- `GRCh38_VDJ.bed.gz`  
T cell and B cell VDJ regions that somatically recombine, chromosomes 2, 14 and 22
- `GRCh38_L1H_gt500.bed.gz`  
L1Hs greater than 500 base pairs

***Files from T2T Consortium***
- `GRCh38_collapsed_duplication_FP_regions.bed.gz`  
conservative collapsed errors with clusters of CHM13 hets in GRCh38
- `GRCh38_population_CNV_FP_regions.bed.gz`  
Collapses in GRCh38 with clusters of CHM13 hets that are variable in the population so many not errors 
- `GRCh38_false_duplications_correct_copy.bed.gz`  
correct copy of falsely duplicated region 
- `GRCh38_false_duplications_incorrect_copy.bed.gz`  
incorrect copy of falsely duplicated region 
- `GRCh38_LD_discordant_haplotypes_slop5bp.bed.gz`  
rare haplotye boundries in GRCh38 
- `GRCh38_gnomAD_InbreedingCoeff_slop1bp_merge1000bp.bed.gz`  
gnomAD inbreedingcoeff variants 

***Files from NIST Human Genomics Team***
- `GRCh38_allOtherDifficultregions.bed.gz`  
union of above regions
- `GRCh38_KIR.bed.gz`  
This region is highly variable in copy number in the population, variant representation is challenging, and mapping-based methods have more errors in this region

--------------------------
METHODOLOGICAL INFORMATION
--------------------------

#### Description of methods used to generate the stratifications:

***GA4GH, GIAB and Human Genomics Team files***\
Most files were generated in Jupyter notebook `GRCh38_Generating_v4.1_excluded_beds.ipynb`. `GRCh38_allOtherDifficultregions.bed.gz` was generated from `merge_difficult_regions_GRCh38_2.01.sh` and `MHC_GRCh38.bed.gz` was generated using conventional coordinates from the Genome Reference Consortium (chr6:28510020-33480577).


***T2T Consortium files***\
The following excerpts are from the T2T variants paper ["A complete reference genome improves analysis of human genetic variation"](https://doi.org/10.1101/2021.07.12.452063). Refer to paper for all references.


Methods for generating `GRCh38_false_duplications_correct_copy.bed.gz` ([Column C in Table S1.3](https://www.biorxiv.org/content/biorxiv/early/2021/07/13/2021.07.12.452063/DC2/embed/media-2.xlsx?download=true)) and `GRCh38_false_duplications_incorrect_copy.bed.gz` ([Column D in Table S1.3](https://www.biorxiv.org/content/biorxiv/early/2021/07/13/2021.07.12.452063/DC2/embed/media-2.xlsx?download=true)) are from supplemental section *"Identifying false duplications in GRCh38"*  

*To identify falsely duplicated regions in GRCh38, we compared copy number estimates of GRCh38 to copy number estimates of 268 genomes from the SGDP dataset using short reads, using a method analogous to comparative read-depth approaches described previously [35,76]. We first averaged the copy number estimates for each genome across 1 kbp windows. For each 1 kbp region, we flagged it as a potential false duplication if the copy number in GRCh38 was greater than the copy number in 99% of the other genomes. Flagged regions were assigned a value of 1 and unflagged regions were assigned a value of 0. To filter the flagged regions, we used a median filter approach with a window size of 3 kbp, where the binary value of each 1 kbp region was replaced with the median value of the complete window. We then merged all adjacent flagged regions and reported the start and end coordinates with respect to T2T-CHM13. To find the corresponding locations of the duplications on GRCh38, we used minimap2 [45] version 2.17-r941 with parameter -p 0.25. Some regions mapped to more than two locations on GRCh38 due to true SDs in the genome. We curated these regions with more than two alignments, and identified the incorrect region(s) as the region(s) that did not have an assembly-assembly alignment from T2T-CHM13 or the HG002 haplotype. We identified the affected, correct region as the region that aligned most closely to the T2T-CHM13 region, which also had reduced HG002 read coverage. Upon curation of the regions with only two alignments on GRCh38, we selected as correct the region that was on the same chromosome arm as the corresponding T2T-CHM13 region. When both regions were on the same chromosome arm, we selected as correct the region that was not adjacent to or between gaps in GRCh38. One false duplication was a tandem duplication, and we arbitrarily selected one copy as correct. Upon curation, we also removed one small 8 kb region (chr19:14,359,000-14,367,000 on T2T-CHM13) that was incorrectly identified as falsely duplicated.*


Methods for generating `GRCh38_collapsed_duplication_FP_regions.bed.gz` ([Rows with Hg38_error=Yes in Table S1.1](https://www.biorxiv.org/content/biorxiv/early/2021/07/13/2021.07.12.452063/DC2/embed/media-2.xlsx?download=true)) and `GRCh38_population_CNV_FP_regions.bed.gz` ([Rows with Hg38_error=No in Table S1.1](https://www.biorxiv.org/content/biorxiv/early/2021/07/13/2021.07.12.452063/DC2/embed/media-2.xlsx?download=true)) are from supplemental section *"Identification of collapsed duplications in GRCh38*  

*We simulated Illumina-like reads (400 million PE 150 bp reads) from T2T-CHM13 reference v1.0 including the GRCh38 Y chromosome using Mason (https://github.com/seqan/seqan/tree/master/apps/mason2) and aligned them to GRCh38 (no alt or decoy contigs) and T2T-CHM13 v1.0 including the GRCh38 Y chromosome using BWA-MEM [40] (Fig. S1.10). Likewise, previously published CHM13 PacBio HiFi reads (~24X, SRA: SRX5633451) [75] were aligned to GRCh38 using minimap2 [45] with the -ax map-pb setting. We called SNVs in both datasets with GATK v4.1.8.1 [41] using minimum MAPQ 30, ploidy 2 and otherwise default parameters. Only PASS variants were used for downstream analyses. Heterozygous variants called by each platform were merged into one multi-sample VCF file with bcftools merge, and the number of heterozygous variants per kbp was calculated using bedtools coverage. For both references, we first defined problematic regions as regions ≥2 kbp with ≥2 heterozygous calls in the CHM13 sample. From this, we connected regions separated by ≤5 kbp, and then filtered for regions ≥5 kbp in size.*

*Focusing on GRCh38-derived problematic regions, we intersected them with previously published RepeatMasker and SD annotations obtained from UCSC Table Browser, as well as known GRC issues [27](ftp://ftp.ncbi.nlm.nih.gov/pub/grc/human/GRC/Issue_Mapping/). For each region, we determined association with SDs [32], centromeres [31], and non-syntenic and novel regions in T2T-CHM13 reference [27], using combined lifted coordinates obtained from all minimap2 hits and UCSC LiftOver [71].*

*Additionally, we obtained variants flagged with excess of heterozygosity by the gnomAD database (InbreedingCoeff in the FILTER field), defined as variants with an inbreeding coefficient < -0.3, but were not filtered due to low read depth, genotype quality, or minor-allele fraction [6]. Empirical enrichment of variants with excessive heterozygosity within problematic regions was obtained by calculating the number of variants in 10,000 randomly sampled regions of the genome using bedtools shuffle. The empirical p-value was calculated as (M+1)/(N+1), where M is the number of iterations yielding a number of features greater than observed and N is the number of iterations.*

*We identified each homologous GRCh38 problematic region in T2T-CHM13 using the following approach: (1) coordinates obtained by UCSC LiftOver using available chain [27] if the size of the lifted region was within 80-120% of the original size, (2) Minimap2 longest hit if the size of the lifted region was within 80-120% of the original size, and closest hit when more than two options were available, and (3) manual selection and curation of remaining coordinates. To assess functional impact, these likely problematic regions were intersected with all gene features in Gencode v35, as well as a curated list of medically relevant genes [23].*

*Using available read-depth copy number estimates in T2T-CHM13 [32], we obtained the overall copy number of the lifted regions as the median window copy number for a "k-merized" version of GRCh38 and T2T-CHM13 references, as well as 268 individuals from the SGDP dataset (excluding sample LP6005442-DNA_A08). Regions where copy number in GRCh38 was lower than T2T-CHM13 and also nearly all SGDP individuals (allowing for one individual with lower copy number) were considered putative collapsed duplications in the GRCh38 reference. Additionally, we intersected lifted coordinates with T2T-CHM13 SDs [32] and centromere annotations [31].*

Methods for generating `GRCh38_LD_discordant_haplotypes_slop5bp.bed.gz` are from supplemental section *"Quantifying artificial haplotype structure in GRCh38"*

*We used PLINK v1.90b6.21 [73] to extract all autosomal SNP pairs with perfect LD (R2 = 1) in the entire 1 sample set using recently published genotype data from the 30x sequencing by NYGC. By definition, GRCh38 carries the reference allele at all sites, so we computed the frequency of REF-REF haplotypes at each of these SNP pairs among the 1KGP samples. We then used HTSlib v.1.12 [74] to query T2T-CHM13 alleles at each corresponding site, again computing the frequency of the observed T2T-CHM13 haplotypes among the 1KGP sample set. This analysis of T2T-CHM13 alleles on GRCh38 coordinates was based on the aforementioned variant calls produced by dipcall, restricting to portions of the alignment involving only a single contig (i.e., the region defined by the dip.bed output file) and excluding regions within 10 bp of an indel that distinguishes the two assemblies. All queried genomes were subjected to these same filtering criteria to ensure a common baseline for comparison. For the GRCh38 haplotypes that were absent (i.e. frequency = 0) among the 1KGP sample set, we intersected the intervals defined by the SNP pairs with the clone tiling path used for the construction of the GRCh38 reference genome (https://hgdownload-test.gi.ucsc.edu/goldenPath/hg38/bigZips/hg38.agp.gz), thereby quantifying the number of rare allelic combinations explained by transitions between adjacent clones.* 

*To compare these results to samples from the 1KGP, we performed a leave-one-out analysis in which for each iteration, we randomly selected a single phased “haploid” genome from the 1KGP sample set and re-computed LD for the full dataset minus that individual. For all SNP pairs in perfect LD (R2 = 1) in the new sample (N = 2503 individuals), we queried the allelic state of the selected haploid sample in the manner previously described. We repeated this analysis for 100 randomly sampled individuals, generating superpopulation-specific distributions of LD-discordant SNP pairs per haploid genome. We again applied the same filtering criteria as were applied to T2T-CHM13 and GRCh38 to ensure a fair comparison*

Methods for generating `GRCh38_gnomAD_InbreedingCoeff_slop1bp_merge1000bp.bed`
We extracted all variants with InbreedingCoeff in the FILTER field from the gnomAD r3.0 vcf for GRCh38. Then, we added 1bp slop on each side and used bedtools merge to include regions between variants that are within 1kbp and remove chrX and chrY due to issues in gnomADr3.0, using the command `zgrep -v ^# gnomad.genomes.r3.0.sites.InbreedingCoeff.vcf.gz | awk '{FS=OFS="\t"} {print $1,$2-2,$2+length($4)+1}' | /Applications/bioinfo/bedtools2.26.0/bin/mergeBed -i stdin -d 1000 | grep -v '^chrX\|chrY' > GRCh38_gnomAD_InbreedingCoeff_slop1bp_merge1000bp.bed`

#### Post Processing of all files:
Post-processing for file consistency was performed and described in GitHub post-processing directory.  Stratification BED(s) were post processed to remove reference Ns, specifically gaps and pseudoautosomal Y regions. The BEDs are merged and sorted and only contain chromosomes 1-22, X and Y. A file crosswalk is provided in the post-processing directory for use in correlating script file naming and files generated in post-processing. 

#### Quality-Assurance of all files:
Coverage of GRCh38 was performed for each chromosome using R. Where applicable coverage comparisons were made between GRCh37 and GRCh38 BED files. We confirmed coverage was as expected. Validation of chromosome coverage can be found in the GitHub validation directory. Benchmarking of a HiFi-DeepVariant callset was also performed using stratifications with hap.py.  Callset was benchmarked against the v4.2.1 GIAB benchmark set to ensure benchmarking statistics in these regions were as expected. 

#### People involved with sample collection, processing, analysis and/or submission:
Rajiv McCoy, Stephanie Yan and Alaina Shumate, Department of Biology, Johns Hopkins University, Baltimore MD, USA\
Daniela C. Soto and Megan Dennis, Biochemistry & Molecular Medicine, Genome Center, MIND Institute, University of California, Davis, Davis, CA, USA

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
