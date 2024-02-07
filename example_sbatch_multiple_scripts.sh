#!/bin/bash
#SBATCH -J INDIVIDUAL
#SBATCH --gres=gpu:lmol:1
#SBATCH --dependency=afterok:21513

lr=(1e-2 1e-3 1e-4 1e-5 1e-2) 
head_dropout=(0.1 0.2 0.3)

for r in "${lr[@]}"; do
    for p in "${head_dropout[@]}"; do
        job_content="#!/bin/bash
#SBATCH -J IND_$r$p
#SBATCH --gres=gpu:lmol:1

python /ibmm_data/TemBERTure/model/code/main.py \
--do_train True \
--model_name_or_path 'Rostlab/prot_bert_bfd' \
--model_type 'BERT_regr' \
--with_adapters True \
--cls_train '/ibmm_data/TemBERTure/MultiTaskDataset/FinalDataset/ClassifierData/classifier_train_filtered' \
--cls_val '/ibmm_data/TemBERTure/MultiTaskDataset/FinalDataset/ClassifierData/classifier_val_filtered' \
--regr_train '/ibmm_data/TemBERTure/MultiTaskDataset/FinalDataset/RegressionData/regression_train_UpDownSampling' \
--regr_val '/ibmm_data/TemBERTure/MultiTaskDataset/FinalDataset/RegressionData/regression_val' \
--wandb_project 'TemBERTure_REGR_1LAYERHEAD' \
--wandb_run_name 'RANDOM_IND_lr"$r"_headdrop"$p"' \
--lr $r \
--head_dropout $p "

        # Write the job content to a .job file
        job_filename="job_lr${r}_headropout${p}.job"
        echo "$job_content" > "$job_filename"
        sbatch "$job_filename"
    done
done

