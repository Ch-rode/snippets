#!/usr/bin/env bash

WORKDIR=~/project/group_work/group5
ALIGNED_DIR=$WORKDIR/results/map

samtools flagstat $ALIGNED_DIR/trimmed_Case3_phred15.mapped.sam \
    > $ALIGNED_DIR/trimmed_Case3_phred15.mapped.sam.stats

# Info on insert size distribution
samtools stats $ALIGNED_DIR/trimmed_Case3_phred15.mapped.sam | grep ^SN | cut -f 2,3