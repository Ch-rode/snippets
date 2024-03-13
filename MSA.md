## 1. SOFTWARE: T-COFFEE
[LINK](https://www.ebi.ac.uk/Tools/msa/tcoffee/)  
[MORE INFO](https://www.ebi.ac.uk/seqdb/confluence/display/JDSAT/T-coffee+Help+and+Documentation#TcoffeeHelpandDocumentation-sequence)
![image](https://github.com/Ch-rode/snippets/assets/61243245/73280a1b-bfa1-4882-ac75-cae91e5c577c)

## 2. VISUALISATION  
**LIBRARY**: [pyMSAviz](https://github.com/moshi4/pyMSAviz/blob/main/docs/getting_started.ipynb)   

**SNIPPET** :
```
from pymsaviz import MsaViz
msa_file ="tcoffe_bro_msa.fasta"

mv = MsaViz(msa_file, wrap_length=40, show_count=True, show_grid=True, show_consensus=True)
mv.savefig("tcoffe_bro_msa_consensus.png")
mv = MsaViz(msa_file, wrap_length=40, show_count=True,)
mv.savefig("tcoffe_bro_msa.png")
```

**OUTPUT**:   
![tcoffe_bro_msa](https://github.com/Ch-rode/snippets/assets/61243245/eaf75c41-7d35-4faf-b9bf-1c8427862176)
![tcoffe_bro_msa_consensus](https://github.com/Ch-rode/snippets/assets/61243245/6c050ae3-c28f-44ef-8566-052bc4c38139)

## BIOPYTHON (without fasta file):
```
from Bio import AlignIO
from Bio.Align import MultipleSeqAlignment
from Bio.SeqRecord import SeqRecord
from Bio.Seq import Seq

# GLOBALXX
meso_seq = ''.join(meso_df['aa'])
thermo_seq = ''.join(thermo_df['aa'])
alignments = pairwise2.align.globalxx(thermo_seq,meso_seq,one_alignment_only=True)
aln = alignments[0]
# Example alignment strings
seq1 = aln.seqA
seq2 = aln.seqB

# Create SeqRecord objects from the sequences
record1 = SeqRecord(Seq(seq1), id="Seq1")
record2 = SeqRecord(Seq(seq2), id="Seq2")

# Create a MultipleSeqAlignment object
alignment = MultipleSeqAlignment([record1, record2])

# At this point, you can use alignment tools or libraries to visualize the alignment.
# For example, you could save this alignment as a .fasta file and then use an external tool to visualize it.
with open("globalxxalignment.fasta", "w") as output_handle:
    AlignIO.write(alignment, output_handle, "fasta")

from pymsaviz import MsaViz
msa_file = "globalxxalignment.fasta"

mv = MsaViz(msa_file, wrap_length=40, show_count=True, show_grid=True, show_consensus=True)
mv.savefig("globalxxalignment.png")
```
