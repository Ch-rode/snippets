#!/usr/bin/env bash

TRIMMED_DIR=~/project/group5/Chiara/trimmed/
READS_DIR=~/project/group5/data/fastq

# fastp parameters
type=("Case" "Control")
cases=(1 2 3)
phred=(10 15 20 25)

mkdir -p "$TRIMMED_DIR"
cd "$TRIMMED_DIR" || exit

# CASES & CONTROL
for t in "${type[@]}"; do
  for i in "${cases[@]}"; do
    for p in "${phred[@]}"; do
      fastp \
      -i "$READS_DIR/${t}${i}_R1.fastq.gz" \
      -I "$READS_DIR/${t}${i}_R2.fastq.gz" \
      -o "$TRIMMED_DIR/trimmed_${t}${i}_R1_phred${p}.fastq.gz" \
      -O "$TRIMMED_DIR/trimmed_${t}${i}_R2_phred${p}.fastq.gz" \
      --unqualified_percent_limit 80 \
      --cut_front \
      --cut_tail \
      --detect_adapter_for_pe \
      --length_required 25 \
      --qualified_quality_phred $p  \
      --thread 4

    done
  done
done

# FASTQ TO CHECK IF ADAPTERS ARE GONE after trimming
fastqc $TRIMMED_DIR*.fastq.gz --thread 4
