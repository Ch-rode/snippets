
#!/usr/bin/env bash
#Alignment statistics
#Write the statistics of the E. coli alignment to file called SRR519926.sam.stats by using samtools flagstat.
cd ~/project/results/alignments/
samtools flagstat SRR519926.sam > SRR519926.sam.stats

#Of the reads, 47.87% is properly paired. The rest isn’t. Proper pairing is quite hard to interpret. 
#It usually means that the 0x2 flag (each segment properly aligned according to the aligner) is false. 
#In this case it means that the insert size is high for a lot of sequences. 
#That is because the insert size distribution is very wide. You can find info on insert size distribution like this:
samtools stats SRR519926.sam | grep  ^SN | cut -f 2,3

#Now look at insert size average and insert size standard deviation.
# You can see the standard deviation is higher than the average, suggesting a wide distribution.