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

Useful links: 
[Github guide 1](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)[Github guide 2](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)[General git guide](https://www.google.com/search?q=markdown+how+to+do+code&client=ubuntu-sn&hs=zMX&channel=fs&sxsrf=APwXEddoS5FSYzkLooD9RFwasJaXk1Fs7Q%3A1686759285759&ei=deeJZJHwLYiB9u8PrqW28AU&ved=0ahUKEwjR_rGAlMP_AhWIgP0HHa6SDV4Q4dUDCA4&uact=5&oq=markdown+how+to+do+code&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIECAAQHjIGCAAQCBAeMggIABCKBRCGAzIICAAQigUQhgMyCAgAEIoFEIYDMggIABCKBRCGAzoKCAAQRxDWBBCwAzoKCAAQigUQsAMQQzoHCCMQsAIQJzoHCAAQDRCABDoGCAAQBxAeOggIABAIEAcQHjoGCAAQHhANOggIABAFEB4QDToICAAQBRAHEB5KBAhBGABQ0gZYsRdghhloAXABeACAAZIBiAH0BZIBAzkuMZgBAKABAcABAcgBCg&sclient=gws-wiz-serp)

## from a3m to fasta
.a3m is an advanced fasta format that allows for inserts, but prody does not like that, the simplest fix is to reformat a3m to fasta with [reformat.pl]([url](https://github.com/soedinglab/hh-suite/blob/master/scripts/reformat.pl)https://github.com/soedinglab/hh-suite/blob/master/scripts/reformat.pl), which is really fast.
i.e. `./reformat.pl uniref90_hits.a3m test.fasta`
