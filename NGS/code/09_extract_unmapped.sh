#!/usr/bin/env bash
#Filtering against unmapped reads (leaving only mapped reads) with samtools view would look like this:
#You will need the 0x4 flag to filter for mapped reads
# samtools view -bh -F 0x4 SRR519926.sorted.bam > SRR519926.sorted.mapped.bam
# samtools view -bh -F 4 SRR519926.sorted.bam > SRR519926.sorted.mapped.bam

#to get only the unmapped reads (so the opposite of the example):

cd ~/project/results/alignments

samtools view -bh -f 0x4 SRR519926.sorted.bam > SRR519926.sorted.unmapped.bam