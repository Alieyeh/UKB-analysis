#!/bin/bash

#SBATCH --job-name=Step11
#SBATCH --time=90:00:00
#SBATCH --mem=60G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=/path/slurm/file_%j.out
#SBATCH --array=0-35


# Read quant pheontypes into array
mapfile -t phenotypes <phenotype_binary.txt


# Run main code with vars
script="regenie_step1_binary.sh"
source $script ${phenotypes[$SLURM_ARRAY_TASK_ID]}
