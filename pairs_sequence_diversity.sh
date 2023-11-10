###################### Inputs ######################
# $1 --> Input dataset1 in fasta format
# $2 --> Input dataset2 in fasta format
# $3 --> Output folder
# SPECIAL THANKS TO SYMELA LAZARIDI FOR THIS CODE
# It runs the fasta sequencies agains themselves and it will create a CheckDiversity folder to save everything there.
# to see sequences diversity: plot the histogram of the 3rd column.
#If doing all vs all you may have the same target and query protein remove columns where $1==$2 and plot the histogram (when query and target are the same)
#then you could also check mean, and std
# DOES NOT WORK WELL WIH SHORT (I.E. CDRH3 LOOP) SEQUENCES

secs_to_human() {
        echo ""
        echo "Elapsed Time: $(( ${1} / 3600 ))h $(( (${1} / 60) % 60 ))m $(( ${1} % 60 ))s"
}

SECONDS=0

echo "Create the Target DB"
# work on the Target DB --> which is the bigger dataset and 1st input 
mkdir -p $3/DataBase/TargetDB

# Create mmseqs database for the target db
mmseqs createdb "$1" "$3/DataBase/TargetDB/targetdb" > "$3/DataBase/TargetDB/log"
# Create index for the target database
mmseqs createindex "$3/DataBase/TargetDB/targetdb" tmp >> "$3/DataBase/TargetDB/log"

echo "Create the Query DB"
# work on the Query DB --> which is the smaller dataset and 2nd input
mkdir -p $3/DataBase/QueryDB

# Create mmseqs database for the query db
mmseqs createdb "$2" "$3/DataBase/QueryDB/querydb" > "$3/DataBase/QueryDB/log"

echo "Searching for pairs between the target and query databases"
mkdir -p $3/DataBase/ResutlDB
# Run the search code
mmseqs search -s 7.0 "$3/DataBase/QueryDB/querydb" "$3/DataBase/TargetDB/targetdb" "$3/DataBase/ResutlDB/resultdb" tmp > "$3/DataBase/ResutlDB/log" 
# Convert the search code into the human readable file Alignment_Results
        #(1,2) identifiers for query and target sequences/profiles
        # (3) sequence identity
        # (4) alignment length
        # (5) number of mismatches
        # (6) number of gap openings
        # (7-8, 9-10) domain start and end-position in query and in target
        # (11) E-value
        # (12) bit score
        # (13) Fraction of query sequence covered by alignment
mmseqs convertalis "$3/DataBase/QueryDB/querydb" "$3/DataBase/TargetDB/targetdb" "$3/DataBase/ResutlDB/resultdb" Alignment_Results --format-output "query,target,pident,alnlen,mismatch,gapopen,qstart,qend,tstart,tend,evalue,bits,qcov" >> "$3/DataBase/ResutlDB/log"

mv  Alignment_Results "$3/Alignment_Results"

secs_to_human "$SECONDS"

echo "Command: search_for_pairs.sh $1 $2 $3 $4"
