#!/usr/bin/env bash
# The command samtools view is very versatile. It takes an alignment file and writes a filtered or processed alignment to the output.
# You can for example use it to compress your SAM file into a BAM file.

#Add a samtools view command to compress our SAM file into a BAM file and include the header in the output. 
#For this, use the -b and -h options.

cd ~/project/results/alignments

samtools view -bh SRR519926.sam > SRR519926.bam

# To look up specific alignments, it is convenient to have your alignment file indexed. An indexing can be compared to a kind of ‘phonebook’
# of your sequence alignment file. Indexing is done with samtools as well, but it first needs to be sorted on coordinate
# (i.e. the alignment location). 
samtools sort SRR519926.bam > SRR519926.sorted.bam
samtools index SRR519926.sorted.bam

#samtools view -H SRR519926.bam
#samtools view -H SRR519926.sorted.bam
#The SO tag at @HD type code has changed from unsorted to coordinate.
#A line with the @PG type code for the sorting was added.
#Note that the command to view the header (samtools -H) is also added to the header for both runs.