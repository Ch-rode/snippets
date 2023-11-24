#!/usr/bin/env bash

ALIGNED_DIR=~/project/group_work/group5/results/map

# Index mapped BAM file (required to extract region)
samtools index $ALIGNED_DIR/trimmed_Case3_phred15.sorted.mapped.bam

# Extract 5:2000000-2500000 from the mapped BAM file
samtools view -bh  $ALIGNED_DIR/trimmed_Case3_phred15.sorted.mapped.bam \
    5:2000000-2500000 \
    > $ALIGNED_DIR/trimmed_Case3_phred15.sorted.mapped.region.bam 

samtools view -H $ALIGNED_DIR/trimmed_Case3_phred15.sorted.mapped.region.bam