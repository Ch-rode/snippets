#!/usr/bin/env bash

ALIGNED_DIR=~/project/group_work/group5/results/map

cd $ALIGNED_DIR 

# Compress (sam2bam)
samtools view -bo trimmed_Case3_phred15.mapped.bam \
    trimmed_Case3_phred15.mapped.sam 

# Sort
samtools sort trimmed_Case3_phred15.mapped.bam \
    > trimmed_Case3_phred15.mapped.sorted.bam
samtools view -H trimmed_Case3_phred15.mapped.sorted.bam # head it 
