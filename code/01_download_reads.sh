#!/usr/bin/env bash

#download the reads from the SRA database using prefetch and fastq-dump from SRA-Tools

cd ~/project
mkdir reads
cd reads
prefetch SRR519926
fastq-dump --split-files SRR519926
## forward read
echo $(cat SRR519926_1.fastq | wc -l)/4 | bc

## reverse read
echo $(cat SRR519926_2.fastq | wc -l)/4 | bc
