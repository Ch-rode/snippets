# snippets


## Python2 
1. create conda env with python2.7  
   `conda create -y -n py27 python=2.7`
2. install biopython on a python2.7 conda env  
`python -m pip install biopython==1.76`

## DSSP
Dssp installation via conda (`conda install -c salilab dssp`) leads to a lot of issues and the Notebook is apparently not working anymore.
Install dssp via old approach from [here](https://github.com/cmbi/dssp) locally (a python env is not necessary).  
`mkdssp --version #mkdssp version 3.1.4`

## GIT from local to github
1. Go inside the folder you want to git (after you have a repo on github)
2. Initialize the folder as a git repo: ```'git init'```
3. From repo to local : git pull git@github.com:Ch-rode/Chiara-LabBook.git
3. From local to repo: 
```
git add .
git status
git commit -m '14/06/2023'
git remote add origin git@github.com:Ch-rode/Chiara-LabBook.git
git push -u origin master
```

Before doing this you should create an ssh key on your local laptop (see following links for instructions) and add it on your personal page on github:  https://github.com/settings/keys

## Create a new repository on the command line
```
echo "# SS_AA_tokenizer" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ibmm-unibe-ch/SS_AA_tokenizer.git
git push -u origin main
```
## Push an existing repository from the command line
```
git remote add origin https://github.com/ibmm-unibe-ch/SS_AA_tokenizer.git
git branch -M main
git push -u origin main
```

## from a3m to fasta
.a3m is an advanced fasta format that allows for inserts, but prody does not like that, the simplest fix is to reformat a3m to fasta with [reformat.pl]([url](https://github.com/soedinglab/hh-suite/blob/master/scripts/reformat.pl)https://github.com/soedinglab/hh-suite/blob/master/scripts/reformat.pl), which is really fast.  
i.e. `./reformat.pl uniref90_hits.a3m test.fasta`

## pymol commands
```
1hl9 pdb
spectrum b, blue_red
bg white
cartoon putty
select prot, name CA
ray 4500, 4500
png /.png
ray [width,height [,renderer [,angle [,shift ]]]
set_color orangef=[255,165,0]
set_color greenf=[74,103,65 ]
```

## print spectrumbar from pytmol
https://pymolwiki.org/index.php/Spectrumbar

## merge folders with also common files
`rsync -av --ignore-existing source-folder/* destination-folder/`

## Copy from UBELIX
`scp -r ciao@submit.unibe.ch://storage/homefs/ciao ./`

## Install BLAST locally + set the path
https://www.ncbi.nlm.nih.gov/books/NBK52640/

## Create a grid of images by terminal using svg_stack (python2)
```
python svg_grid.py --rows 1 --cols 2  \
./img/30_clusters_size.svg \
./img/30barplot_avgsimilarities.svg \
> hamming_distance_clusters.png
```

## imagemagick
```
sudo apt install imagemagick  # Su Ubuntu/Debian
montage *.png -geometry +0+0 -tile x output.png #Calcolare il layout automatico
montage *.png -geometry +0+0 -tile 4x output.png #Specificare manualmente il numero di colonne

N=$(ls *.png | wc -l)  # Conta il numero di immagini
COLS=$(echo "sqrt($N)" | bc)  # Numero di colonne (radice quadrata arrotondata per difetto)
ROWS=$(( (N + COLS - 1) / COLS ))  # Calcola le righe
montage *.png -geometry +0+0 -tile ${COLS}x${ROWS} output.png

########## COMBINARE IMMAGINI
mkdir -p combined_images  # Crea la cartella per le immagini combinate

for img in DEKOSKY_DONOR1/*.png; do
    full_filename=$(basename "$img")  # Es. "c_call_broad_PCA_with_marginalsDEKOSKY_DONOR1.png"
    
    # Estrai il nome base rimuovendo "DEKOSKY_DONOR1" senza underscore
    base_name=$(echo "$full_filename" | sed -E 's/(DEKOSKY_DONOR1|DEKOSKY_DONOR2|DEKOSKY_DONOR3|IMV_3_22_24)\.png$//')

    echo "Processing: $base_name"

    # Controllo che tutti i file esistano prima di chiamare montage
    if [[ -f "DEKOSKY_DONOR1/${base_name}DEKOSKY_DONOR1.png" && \
          -f "DEKOSKY_DONOR2/${base_name}DEKOSKY_DONOR2.png" && \
          -f "DEKOSKY_DONOR3/${base_name}DEKOSKY_DONOR3.png" && \
          -f "IMV_3_22_24/${base_name}IMV_3_22_24.png" ]]; then

        montage DEKOSKY_DONOR1/"${base_name}DEKOSKY_DONOR1.png" \
                DEKOSKY_DONOR2/"${base_name}DEKOSKY_DONOR2.png" \
                DEKOSKY_DONOR3/"${base_name}DEKOSKY_DONOR3.png" \
                IMV_3_22_24/"${base_name}IMV_3_22_24.png" \
                -tile 2x2 -geometry +2+2 combined_images/"${base_name}.png"
    else
        echo "❌ Missing files for: $base_name"
    fi
done

```

## MULTI-GPU training (with accelerate)
nproc_per_node is the number of gpus, specify CUDA_VISIBLE_DEVICES in case of issues like i.e. "Duplicate GPU detected: rank 3 and rank 1 both on CUDA device a1000"  
`CUDA_VISIBLE_DEVICES=0,1,2,3 torchrun --nproc_per_node=4 run_mlm_no_trainer.py`



