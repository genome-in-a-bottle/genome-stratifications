#HG001

#PG
#/Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37.vcf.gz > /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
#grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37.vcf.gz -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetsnp10bp_slop50.bed | wc -l
#   56005
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetsnp10bp_slop50.bed | wc -l
#   30998

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37.vcf.gz -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetindel10bp_slop50.bed | wc -l
#   46618
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetindel10bp_slop50.bed | uniq | wc -l
#   37222

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37.vcf.gz -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_complexindel10bp_slop50.bed | wc -l
#   58590
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_complexindel10bp_slop50.bed | uniq | wc -l
#   36247

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37.vcf.gz -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_snpswithin10bp_slop50.bed | wc -l
#   194330
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/PlatinumGenomes/PG2016-1.0/PG2016-1.0_NA12878_b37_snpswithin10bp_slop50.bed | uniq | wc -l
#   107755


##RTG
#/Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878.vcf.gz > /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878.vcf.gz -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_comphetsnp10bp_slop50.bed | wc -l
#   60576
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_comphetsnp10bp_slop50.bed | wc -l
#   36461

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_comphetindel10bp_slop50.bed | wc -l
#   110016
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_comphetindel10bp_slop50.bed | uniq | wc -l
#   107856

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_complexindel10bp_slop50.bed | wc -l
#   126365
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_complexindel10bp_slop50.bed | uniq | wc -l
#   121610

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_snpswithin10bp_slop50.bed | wc -l
#   247432
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_geno2haplo10.vcf -b /Users/jzook/Documents/NA12878/RTG/RTG_Illumina_Segregation_Phasing_161004/sp_v37.7.3.NA12878_snpswithin10bp_slop50.bed | uniq | wc -l
#   163493

#HG001 NIST v3.3.2
#/Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer.vcf.gz > /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer.vcf.gz -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetsnp10bp_slop50.bed | wc -l
#   52693
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetsnp10bp_slop50.bed | wc -l
#   28935

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer.vcf.gz -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetindel10bp_slop50.bed | wc -l
#   62457
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetindel10bp_slop50.bed | uniq | wc -l
#   54061

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer.vcf.gz -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_complexindel10bp_slop50.bed | wc -l
#   43740
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_complexindel10bp_slop50.bed | uniq | wc -l
#   23079

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer.vcf.gz -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_snpswithin10bp_slop50.bed | wc -l
#   191485
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_geno2haplo10.vcf -b /Users/jzook/Downloads/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_snpswithin10bp_slop50.bed | uniq | wc -l
#   105014

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/GIABv3.3.2/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/GIABv3.3.2/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/GIABv3.3.2/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/GIABv3.3.2/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_RTGandPGphasetransfer_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/PG2016-1.0/PG2016-1.0_NA12878_b37_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/PG2016-1.0/PG2016-1.0_NA12878_b37_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/PG2016-1.0/PG2016-1.0_NA12878_b37_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/RTG_37.7.3/sp_v37.7.3.NA12878_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/RTG_37.7.3/sp_v37.7.3.NA12878_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/RTG_37.7.3/sp_v37.7.3.NA12878_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/RTG_37.7.3/sp_v37.7.3.NA12878_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/SVs/PacBio_MetaSV_mergedSVs.bed.gz  | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG001_NA12878/GIABv3.3.2/HG001_genomespecific_complexandSVs_v3.3.2_PG_RTG.bed.gz



#HG002
/Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz > /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetsnp10bp_slop50.bed | wc -l
#   49212
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetsnp10bp_slop50.bed | wc -l
#   27654

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetindel10bp_slop50.bed | wc -l
#   70041
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetindel10bp_slop50.bed | uniq | wc -l
#   57696

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_complexindel10bp_slop50.bed | wc -l
#   58590
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_complexindel10bp_slop50.bed | uniq | wc -l
#   36247

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased.vcf.gz -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_snpswithin10bp_slop50.bed | wc -l
#   184467
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_geno2haplo10.vcf -b /Users/jzook/Downloads/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_snpswithin10bp_slop50.bed | uniq | wc -l
#   101929

#find union of complex variants and SVs
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv3.3.2/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv3.3.2/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv3.3.2/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv3.3.2/HG002_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-22_v.3.3.2_highconf_triophased_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/HG002_HG003_HG004_allsvs_merged.bed.gz | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv3.3.2/HG002_genomespecific_complexandSVs_v3.3.2.bed.gz

##HG002 v4.1
#Merge nearby phased variants to create the subsets below (vcflib sometimes outputs extra duplicate lines, so need to sort and deduplicate)
/Volumes/DroboZook/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r /Volumes/giab/data/reference_genomes/human_g1k_v37.fasta /Volumes/giab/analysis/v4-development/NIST_v4.1_SmallVariantDraftBenchmark_12182019/GRCh37/HG002_GRCh37_1_22_v4.1_draft_benchmark.vcf | grep -v '^#' | cut -f1-5,10 | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | uniq | > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.tsv

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/v4-development/NIST_v4.1_SmallVariantDraftBenchmark_12182019/GRCh37/HG002_GRCh37_1_22_v4.1_draft_benchmark.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetsnp10bp_slop50.bed | wc -l
#   30427
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetsnp10bp_slop50.bed | cut -f1-5 | sort -k1,1n -k2,2n | uniq | wc -l
#   18251

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/v4-development/NIST_v4.1_SmallVariantDraftBenchmark_12182019/GRCh37/HG002_GRCh37_1_22_v4.1_draft_benchmark.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetindel10bp_slop50.bed | wc -l
#   65168
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetindel10bp_slop50.bed | cut -f1-5 | sort -k1,1n -k2,2n | uniq | wc -l
#   62121

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/v4-development/NIST_v4.1_SmallVariantDraftBenchmark_12182019/GRCh37/HG002_GRCh37_1_22_v4.1_draft_benchmark.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_complexindel10bp_slop50.bed | wc -l
#   41939
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_complexindel10bp_slop50.bed | cut -f1-5 | sort -k1,1n -k2,2n | uniq | wc -l
#   23567

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/v4-development/NIST_v4.1_SmallVariantDraftBenchmark_12182019/GRCh37/HG002_GRCh37_1_22_v4.1_draft_benchmark.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_snpswithin10bp_slop50.bed | wc -l
#   184467
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/intermediatefiles/HG002_GRCh37_1_22_v4.1_draft_benchmark_geno2haplo10.vcf -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_snpswithin10bp_slop50.bed | cut -f1-5 | sort -k1,1n -k2,2n | uniq | wc -l
#   101929

#Find additional unphased complex variants and overlapping variants that vcflib ignores
awk '{FS = OFS = "\t"} { print $1,$2,$2+length($4)}' /Volumes/giab/analysis/v4-development/NIST_v4.1_SmallVariantDraftBenchmark_12182019/GRCh37/HG002_GRCh37_1_22_v4.1_draft_benchmark.vcf | grep -v ^# | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 10 -c 3 -o count | awk '{FS = OFS = "\t"} { if($4>1) print $1,$2-50,$3+50}' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetindel10bp_slop50.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetsnp10bp_slop50.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_complexindel10bp_slop50.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/subtractBed -a stdin -b /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_snpswithin10bp_slop50.bed > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_othercomplexwithin10bp_slop50.bed

#find union of CNVs and SVs
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/expanded_150_HG002_SVs_Tier1plusTier2_v0.6.1.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/HG2_SKor_TrioONTCanu_intersect_HG2_SKor_TrioONTFlye_intersect_HG2_SKor_CCS15_gt10kb_GRCh37.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/HG002_SVs_Tier1plusTier2_v0.6.1.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/hsd37d5.112719.inversions_slop150_chr1_22.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/mrcanavar_intersect_ccs_1000_window_size_cnv_threshold_intersect_ont_1000_window_size_cnv_threshold.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/union_HG002_CCS_15kb_20kb_merged_ONT_1000_window_size_combined_elliptical_outlier_threshold.bed | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/HG002_genomespecific_CNVsandSVs_v4.1.bed.gz
#find union of complex variants and SVs
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetindel10bp_slop50.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_comphetsnp10bp_slop50.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_complexindel10bp_slop50.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_snpswithin10bp_slop50.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_GRCh37_1_22_v4.1_draft_benchmark_othercomplexwithin10bp_slop50.bed /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/SVs/HG002_genomespecific_CNVsandSVs_v4.1.bed.gz | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG002/GIABv4.1/HG002_genomespecific_complexandSVs_v4.1.bed.gz


##HG003 v3.3.2
#gunzip -c /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz | sed 's/1\/1/1|1/' | /Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | uniq > /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed | wc -l
#   23413
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed | wc -l
#   12323

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed | wc -l
#   52597
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed | uniq | wc -l
#   49252

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed | wc -l
#   37212
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed | uniq | wc -l
#   19948

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed | wc -l
#   182800
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed | uniq | wc -l
#   101314

#find union of complex variants and SVs
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG003/GIABv3.3.2/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG003/GIABv3.3.2/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG003/GIABv3.3.2/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG003/GIABv3.3.2/HG003_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG003/SVs/HG002_HG003_HG004_allsvs_merged.bed.gz | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG003/GIABv3.3.2/HG003_genomespecific_complexandSVs_v3.3.2.bed.gz


##HG004 v3.3.2
#gunzip -c /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz | sed 's/1\/1/1|1/' | /Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | uniq > /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed | wc -l
#   20958
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed | wc -l
#   11165

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed | wc -l
#   53647
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed | uniq | wc -l
#   50650

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed | wc -l
#   37794
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed | uniq | wc -l
#   20227

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed | wc -l
#   183985
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed | uniq | wc -l
#   102023

#find union of complex variants and SVs
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG004/GIABv3.3.2/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG004/GIABv3.3.2/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG004/GIABv3.3.2/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG004/GIABv3.3.2/HG004_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG004/SVs/HG002_HG003_HG004_allsvs_merged.bed.gz  | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG004/GIABv3.3.2/HG004_genomespecific_complexandSVs_v3.3.2.bed.gz


##HG005 v3.3.2
#gunzip -c /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf.vcf.gz | sed 's/1\/1/1|1/' | /Applications/bioinfo/vcflib_140404/bin/vcfgeno2haplo -w 10 -r ~/Documents/references/human_g1k_v37.fasta | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | uniq > /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf

#Find compound hets with no length change (i.e., only compound hets where both alleles contain only SNPs or MNPs within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)==length($5) && length($4)==length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed | wc -l
#   12123
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed | wc -l
#   7070

#Find compound hets where at least 1 allele has a length change (i.e., only compound hets where at least one allele contains an indel within 10bp) 
grep '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t\|,"; OFS = "\t"} {if (length($4)!=length($5) || length($4)!=length($6)) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed | wc -l
#   34788
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed | uniq | wc -l
#   33299

#Find complex variants that are not compound hets where there is a length change and it is not a simple insertion or deletion
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)!=length($5) && length($4)>1 && length($5)>1) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed | wc -l
#   31602
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed | uniq | wc -l
#   16846

#Find SNPs within 10bp that are not compound hets
grep -v '1/2\|1|2\|2|1\|2/1' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | awk 'BEGIN {FS = "\t"; OFS = "\t"} {if (length($4)==length($5) && length($4)>1 ) print $1,$2-50,$2+length($4)+50}' | sed 's/^X/23/' | sort -k1,1n -k2,2n | sed 's/^23/X/' | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin -d 50 > /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed

/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf.vcf.gz -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed | wc -l
#   179205
awk 'BEGIN {FS = "\t"; OFS = "\t"} { print $1,$2,$2+length($4)}' /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_geno2haplo10.vcf | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/intersectBed -a stdin -b /Users/jzook/Downloads/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed | uniq | wc -l
#   99532

#find union of complex variants and SVs
/Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/multiIntersectBed -i /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG005/GIABv3.3.2/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG005/GIABv3.3.2/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_comphetsnp10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG005/GIABv3.3.2/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_complexindel10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG005/GIABv3.3.2/HG005_GRCh37_highconf_CG-IllFB-IllGATKHC-Ion-SOLID_CHROM1-22_v.3.3.2_highconf_snpswithin10bp_slop50.bed.gz /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG005/SVs/HG005_HG006_HG007_FB_GATKHC_CG_MetaSV_allsvs_merged.bed.gz  | /Volumes/DroboZook/bioinfo/bedtools2.25.0/bin/mergeBed -i stdin | /Volumes/DroboZook/bioinfo/htslib-1.3.2/bgzip -c > /Volumes/giab/analysis/benchmarking-tools/resources/stratification-bed-files/GenomeSpecific/HG005/GIABv3.3.2/HG005_genomespecific_complexandSVs_v3.3.2.bed.gz
