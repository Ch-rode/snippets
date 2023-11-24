#!/usr/bin/env bash

'''Prepare the reference sequence part 2
build the indexed reference genome with bowtie2 using default options.'''

cd ~/project/ref_genome

bowtie2-build ecoli-strK12-MG1655.fasta ecoli-strK12-MG1655.fasta
