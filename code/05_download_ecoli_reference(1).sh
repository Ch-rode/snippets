#!/usr/bin/env bash

'''Prepare the reference sequence part 1. Use it to retrieve the reference sequence using esearch and efetch'''

REFERENCE_DIR=~/project/ref_genome/

mkdir $REFERENCE_DIR
cd $REFERENCE_DIR

esearch -db nuccore -query 'U00096' \
| efetch -format fasta > ecoli-strK12-MG1655.fasta