#!/usr/bin/env bash

#We are going to align the sequences in paired-end mode. What are the options we ll minimally need? 

#According to the usage of bowtie2:
#bowtie2 [options]* -x <bt2-idx)> {-1 <m1> -2 <m2> | -U <r> | --interleaved <i> | --sra-acc <acc> | b <bam>}

#Well need the options:
#-x to point to our index: is the INDEX NAME(PREFIX BASE NAME
#-1 and -2 to point to our forward and reverse reads'''

TRIMMED_DIR=~/project/results/trimmed
REFERENCE_DIR=~/project/ref_genome/
ALIGNED_DIR=~/project/results/alignments

mkdir -p $ALIGNED_DIR

bowtie2 \
-x $REFERENCE_DIR/ecoli-strK12-MG1655.fasta \
-1 $TRIMMED_DIR/trimmed_SRR519926_1.fastq \
-2 $TRIMMED_DIR/trimmed_SRR519926_2.fastq \
> $ALIGNED_DIR/SRR519926.sam