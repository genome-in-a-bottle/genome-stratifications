#!/usr/bin/bash
## Generate lowmappabilityall.bed.gz and notinlowmappabilityall.bed.gz

multiIntersectBed \
    -i human_g1k_v37_gemmap_l100_m2_e1_nonuniq.sort.bed.gz \
    human_g1k_v37_gemmap_l250_m0_e0_nonuniq.sort.bed.gz  \
    | mergeBed -i stdin \
    | bgzip -c \
    > lowmappabilityall.bed.gz

subtractBed \
    -a intermediatefiles/human.b37.genome.bed \
    -b lowmappabilityall.bed.gz \
    | bgzip -c > notinlowmappabilityall.bed.gz