#!/bin/bash

#Create a db from the original file (6m)
mmseqs createdb healthy_igg_cdrh3.fasta healthy_igg_cdrh3_MMSEQS_DB

# pident 100 
mmseqs cluster healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_100_ tmp --min-seq-id 1
mmseqs createsubdb healthy_igg_cdrh3_100_ healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_100_rep #not a readable file
mmseqs convert2fasta healthy_igg_cdrh3_100_rep healthy_igg_cdrh3_100_rep.fasta #only centroids seqs
mmseqs createtsv healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_100_ healthy_igg_cdrh3_100_cluster.tsv col0: centroid id col1:seqs id inside the cluster
mmseqs createseqfiledb healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_100_ healthy_igg_cdrh3_100_cluster_seqs
mmseqs result2flat healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_MMSEQS_DB  healthy_igg_cdrh3_100_cluster_seqs  healthy_igg_cdrh3_100_all_seqs.fasta #file with centroids id,then centroids fasta and then all the fasta seqs of all the proteins inside the cluster

# pident 90
mmseqs cluster healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_90_ tmp --min-seq-id 0.9
mmseqs createsubdb healthy_igg_cdrh3_90_ healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_90_rep #not a readable file
mmseqs convert2fasta healthy_igg_cdrh3_90_rep healthy_igg_cdrh3_90_rep.fasta #only centroids seqs
mmseqs createtsv healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_90_ healthy_igg_cdrh3_90_cluster.tsv col0: centroid id col1:seqs id inside the cluster
mmseqs createseqfiledb healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_90_ healthy_igg_cdrh3_90_cluster_seqs
mmseqs result2flat healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_MMSEQS_DB  healthy_igg_cdrh3_90_cluster_seqs  healthy_igg_cdrh3_90_all_seqs.fasta #file with centroids id,then centroids fasta and then all the fasta seqs of all the proteins inside the cluster




# pident 70
mmseqs cluster healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_70_ tmp --min-seq-id 0.7
mmseqs createsubdb healthy_igg_cdrh3_70_ healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_70_rep #not a readable file
mmseqs convert2fasta healthy_igg_cdrh3_70_rep healthy_igg_cdrh3_70_rep.fasta #only centroids seqs
mmseqs createtsv healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_70_ healthy_igg_cdrh3_70_cluster.tsv col0: centroid id col1:seqs id inside the cluster
mmseqs createseqfiledb healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_70_ healthy_igg_cdrh3_70_cluster_seqs
mmseqs result2flat healthy_igg_cdrh3_MMSEQS_DB healthy_igg_cdrh3_MMSEQS_DB  healthy_igg_cdrh3_70_cluster_seqs  healthy_igg_cdrh3_70_all_seqs.fasta #file with centroids id,then centroids fasta and then all the fasta seqs of all the proteins inside the cluster



# transform the centroids fasta file into a csv ID,SEQ

awk '/^>/ { printf("\n%s,", substr($0, 2)); next; } { printf("%s", $0);} END { printf("\n"); }'  healthy_igg_cdrh3_70_rep.fasta > healthy_igg_cdrh3_70_rep_seq ## healthy_igg_cdrh3_70_rep_seq.fasta is called in this case healthy_igg_cdrh3_70_clustered_seq.fasta
awk '/^>/ { printf("\n%s,", substr($0, 2)); next; } { printf("%s", $0);} END { printf("\n"); }'  healthy_igg_cdrh3_90_rep.fasta > healthy_igg_cdrh3_90_rep_seq
awk '/^>/ { printf("\n%s,", substr($0, 2)); next; } { printf("%s", $0);} END { printf("\n"); }'  healthy_igg_cdrh3_100_rep.fasta > healthy_igg_cdrh3_100_rep_seq
