#!/bin/sh

#  MRG_falsely_duplicated.sh
#  Created by McDaniel, Jennifer on 03/17/2021
#  This file was generated during development of benchmark for Medically Relevant Genes and represents medically relevant genes that were identified as falsely duplicated in either GRCh37 or GRCh38. These files are included with FunctionalTechnicallyDifficultRegions stratification regions.

#find coordinates for CBS, CRYAA, and KCNE1, which are all falsely duplicated in GRCh38
awk '$4=="CBS" || $4=="CRYAA" || $4=="KCNE1"' GRCh38_MRG_benchmark_gene_coordinates.bed | bgzip > ~/Documents/GiaB/Benchmarking/mrg_benchmark_eval/resources/stratifications/GRCh38/GRCh38_MRG_benchmark_gene_coordinates_falselyduplicated.bed.gz


#find coordinates for MRC1 and CNR2 and alter CNR2 start to only include the part that is in the self chain, which are falsely duplicated in GRCh37
awk '$4=="MRC1" || $4=="CNR2"' GRCh37_MRG_benchmark_gene_coordinates.bed | sed 's/24197016/24256638/' | bgzip > ~/Documents/GiaB/Benchmarking/mrg_benchmark_eval/resources/stratifications/GRCh37/GRCh37_MRG_benchmark_gene_coordinates_falselyduplicated.bed.gz
