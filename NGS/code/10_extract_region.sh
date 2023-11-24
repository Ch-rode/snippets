#!/usr/bin/env bash
#samtools view also enables you to filter alignments in a specific region. This can be convenient if you don’t want to work with huge alignment files and if
# you’re only interested in alignments in a particular region. Region filtering only works for sorted and indexed alignment files.

#in this script: 
# filter our sorted and indexed BAM file for the region between 2000 and 2500 kb, and output it as a BAM file with a header.
cd ~/project/results/alignments

samtools view -bh \
SRR519926.sorted.bam \
U00096.3:2000000-2500000 \
> SRR519926.sorted.region.bam