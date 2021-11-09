JM 12/5/19
Previously we were using the GCA_000001405.15_GRCh38_no_alt_plus_hs38d1_analysis_set_REF_N.bed
refNs BED, however for consistency with GRCh37 we wanted the refN bed file processed in the 
same manner therefore decided to use Aarons gap BED file.It appeared Aarons gap file 
hg38.gap.bed.gz contained centromeres.  There was ambiguity in his script hg38.README_annotation.md 
regarding how this file was generated w/ and w/o centromeres.txt, therefore we decided to 
re-make to ensure centromeres were not included.  

rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/gap.txt.gz .
gzcat gap.txt.gz | cut -f2-4,8 |
    awk '{n=$4; if(n=="clone" || 
    n=="contig" || 
    n=="scaffold" || 
    n=="short_arm") { n="gap"; } print $1"\t"$2"\t"$3"\t"n; }' |
    sort -k1,1 -k2,2g | 
    bgzip -c > gap38.bed.gz
tabix -f gap38.bed.gz

gzcat gap38.bed.gz | 
	sed 's/^chr//'|
	grep -Ev '^M|^[0-9][0-9]_|[0-9]_|^Un'| 
	sed 's/^X/23/;s/^Y/24/' | 
	sort -k1,1n -k2,2n | 
	sed 's/^23/X/;s/^24/Y/' |
	sed 's/^[a-zA-Z0-9_]/chr&/' | 
	bedtools merge -i stdin -d 100 > gap_38_1thruY_sorted_merged.bed

12/10/19
Created psuedoautosomal region bed files (PSA_Y_GRCh38.bed) for Y using information found on UCSC genome site 
PSA regions for Y (GRCh38) : chrY:10,000-2,781,479 and chrY:56,887,902-57,217,415