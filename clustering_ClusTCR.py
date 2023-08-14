import pandas as pd
from clustcr import read_cdr3, Clustering
import argparse
import logging
import subprocess
import time

#python clustering_ClusTCR.py --cdrh3_data HIV_IGG/CLUSTERING/hiv_igg_cdrh3_seqs
# parse infile and outfile
parser = argparse.ArgumentParser(
                    prog='ProgramName',
                    description='What the program does',
                    epilog='Text at the bottom of help')

parser.add_argument('--cdrh3_data')   #file must be in the format SEQ (no header)
args = parser.parse_args()

file_path = args.cdrh3_data  # Replace with the actual file path
#delimiter = ','  # Replace with the appropriate delimiter if needed
n_cpus = 40

# Configure logging
logging.basicConfig(level=logging.INFO, filename='clustering_ClusTCR.log')
logger = logging.getLogger(__name__)

# Removing sequences that contains non amino acids 'X'
file_path_noxaa = file_path +'_noxaa'
command = f'grep -v X {file_path} > {file_path_noxaa}'
print(command)
output = subprocess.check_output(command, shell=True, text=True)

# Read the text file into a DataFrame, cdrh3 seqs must me a Series
data_frame = pd.read_csv(file_path_noxaa, header=None)
logger.info(f"DATA AFTER REMOVING AMINO ACIDS SEQUENCES WITH X:{file_path_noxaa}")
data = data_frame[0] #cdr h3 must be a python series
n_seqs = len(data)

# Clustering
t0 = time.time()
clustering = Clustering(n_cpus=n_cpus,method='faiss') # Clustering parameters
result = clustering.fit(data) # This will generate the ClusteringResult object
t1 = time.time()
t = t1 - t0
logger.info('Clustered %s sequences with clusTCR in %s minutes, using %s cpus' % (n_seqs, t/60, n_cpus))

#result.clusters_df
result.summary().to_csv(file_path_noxaa+'_clusters_summary',index=False)
logger.info(f"Number of clusters : {len(result.summary())}")
result.write_to_csv(path=file_path_noxaa+'_clusters')
logger.info(f"Number of seqs in the clusters : {len(result.clusters_df)}")

