#!/usr/bin/env bash

ALIGNED_DIR=~/project/group_work/group5/results/map

# Extract only mapped reads (-F 4 = -F 0x4)
samtools view -bh -F 4 $ALIGNED_DIR/trimmed_Case3_phred15.mapped.sorted.bam \
    > $ALIGNED_DIR/trimmed_Case3_phred15.sorted.mapped.bam

# Extract only the unmapped reads
samtools view -bh -f 4 $ALIGNED_DIR/trimmed_Case3_phred15.mapped.sorted.bam \
    > $ALIGNED_DIR/trimmed_Case3_phred15.sorted.unmapped.bam

# Count unmapped reads
samtools view -c $ALIGNED_DIR/trimmed_Case3_phred15.sorted.unmapped.bam