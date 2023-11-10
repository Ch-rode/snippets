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
