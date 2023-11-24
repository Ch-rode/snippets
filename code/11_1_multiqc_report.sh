#!/usr/bin/env bash

#QC summary
#The software MultiQC is great for creating summaries out of log files and reports from many different bioinformatic tools 
#(including fastqc, fastp, samtools and bowtie2). You can specify a directory that contains any log files, 
#and it will automatically search it for you. 

cd ~/project/results/
multiqc .