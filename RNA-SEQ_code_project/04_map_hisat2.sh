#!/usr/bin/env bash

WORKDIR=~/project/group_work/group5
DATAPATH=$WORKDIR/data
TRIMMED_DIR=$WORKDIR/results/trimmed
OUTPUT=$WORKDIR/results/map

mkdir -p $OUTPUT
cd $OUTPUT

# Create hisat index - done
hisat2-build Mus_musculus.GRCm38.dna.chromosome.5.fa \
    Mus_musculus.GRCm38.dna.chromosome.5.fa

# Map
# USAGE: hisat2 [options]* -x <hisat2-idx> {-1 <m1> -2 <m2> | -U <r> | --sra-acc <SRA accession number>} [-S <hit>]

hisat2 \
    -x $DATAPATH/reference/Mus_musculus.GRCm38.dna.chromosome.5.fa \
    -1 $TRIMMED_DIR/trimmed_Case3_R1_phred15.fastq.gz \
    -2 $TRIMMED_DIR/trimmed_Case3_R1_phred15.fastq.gz \
    -S $OUTPUT/trimmed_Case3_phred15.mapped.sam