### INSTALL AND RUN MMSEQ ALGORITHM (already installed locally) FOR THE PROTEINS SEQUENCES TO GET RID OF VERY SIMILAR PROTEINS (CLUSTERING)

Clustering Sequences using the MMSeqs2 code.
MMSeqs2 is a tool for sequence clustering in linear time.
Any additional information about the code can be found in their user's Guide.

Installing MMSeqs2 for Ubuntu: Shell Commands instructions Github Page

```sudo apt install mmseqs2```

```
Run Command

    Input: A txt file with all the fasta sequences (i.e. dataset.txt)
    Output: Three files starting with specified prefix:

        _cluster.tsv: A two column table.
            Column 1 --> Ids of the Clusters' Centroids
            Column 2 --> Ids of the sequences that belong to the correspondin cluster pointed in the 1st column
        _rep_seq.fasta: Fasta sequences of all the centroids of the clusters
        _all_seqs.fasta: All the sequences given by the input file but clustered under the id of the centroid
```
The general command is the following where the dataset.txt is the file containing the fasta sequences (not necessary one-line fasta), the prefix-for-the-output/ is the starting name for output files and tmp is a directory created autonomously containg files that the algorithm needs:
```
mmseqs easy-cluster ./dataset.txt ./prefix-for-the-output tmp
```
If you have mmseqs installed in your $PATH you can launch it without using the bin/mmseqs path but only the keyword "mmseqs" (i.e. --mmseqs_path_bin mmseqs)
