#!/usr/bin/env bash

# maps the reads with bowtie2, sorts them, and outputs them as a BAM file with a header.

TRIMMED_DIR=~/project/results/trimmed
REFERENCE_DIR=~/project/ref_genome
ALIGNED_DIR=~/project/results/alignments

bowtie2 \
-x $REFERENCE_DIR/ecoli-strK12-MG1655.fasta \
-1 $TRIMMED_DIR/trimmed_SRR519926_1.fastq \
-2 $TRIMMED_DIR/trimmed_SRR519926_2.fastq \
2> $ALIGNED_DIR/bowtie2_SRR519926.log \
| samtools sort - \
| samtools view -bh - \
> $ALIGNED_DIR/SRR519926.sorted.mapped.frompipe.bam


#Notice the line starting with 2>. This redirects standard error to a file: $ALIGNED_DIR/bowtie2_SRR519926.log. 
#This file now contains the bowtie2 logs, that can later be re-read or used in e.g. multiqc. 

#Index the alignment that was filtered for the region between 2000 and 2500 kb:

