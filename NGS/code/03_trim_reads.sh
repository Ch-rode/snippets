#!/usr/bin/env bash

#We will use fastp for trimming adapters and low quality bases from our reads. The most used adapters for Illumina are TruSeq adapters, and fastp will use those by default

#The quality of our dataset is not great, so we will overwrite the defaults. Use a a minimum qualified base quality of 10, set the maximum percentage of unqalified bases to 80% and a minimum read length of 25. 

#Note that we have set the options --cut_front and --cut_tail that will ensure low quality bases are trimmed in a sliding window from both the 5’ and 3’ ends. Also --detect_adapter_for_pe is set, which ensures that adapters are detected automatically for both R1 and R2. 

TRIMMED_DIR=~/project/results/trimmed
READS_DIR=~/project/reads

mkdir -p $TRIMMED_DIR

cd $TRIMMED_DIR

fastp \
-i $READS_DIR/SRR519926_1.fastq \
-I $READS_DIR/SRR519926_2.fastq \
-o $TRIMMED_DIR/trimmed_SRR519926_1.fastq \
-O $TRIMMED_DIR/trimmed_SRR519926_2.fastq \
--qualified_quality_phred 10 \
--length_required 25 \
--unqualified_percent_limit 80 \
--cut_front \
--cut_tail \
--detect_adapter_for_pe
