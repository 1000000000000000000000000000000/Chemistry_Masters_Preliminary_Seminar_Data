#!/bin/bash

#SBATCH --ntasks=1
#SBATCH -c 8
#SBATCH --mem=0
#SBATCH --time=72:00:00
#SBATCH -D /home/rpearson/research/PosValSet/IT/P10636/model_copies
#SBATCH -J P10636_IT_model3_MQA
#SBATCH --output=P10636_IT_model3_MQA.out

####### ::: NOTE ::::
####### To use this enter the following:
####### >> sbatch <bash script file path> <pdb file name>
#######
####### Must be in the directory where the pdb file is!

source activate model_evaluation
which python

RETURNPATH=$(pwd)
PDBFILEPATH=$(pwd)/$1
echo PROCESSING: $PDBFILEPATH

PRETRAINEDMODELPATH='/home/rpearson/tools_bin/model_evaluation_tools/3DCNN_MQA/pretrained_model/pretrained_model.npz'

# Go to directory containing the MQA python file exists
cd /home/rpearson/tools_bin/model_evaluation_tools/3DCNN_MQA/source

# Run predict_from_pdb.py using CPU Only
/home/rpearson/.conda/envs/model_evaluation/bin/python3 predict_from_pdb.py -i $PDBFILEPATH -m $PRETRAINEDMODELPATH

cd $RETURNPATH