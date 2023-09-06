#!/bin/bash

#SBATCH --job-name=Step21
#SBATCH --time=90:00:00
#SBATCH --mem=500G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --array=0-37
#SBATCH --output=/path/slurm/file_%j.out


# Read quant pheontypes into array
mapfile -t phenotypes <phenotype_binary.txt


# Run main code with vars
script="regenie_step2_binary.sh"
source $script ${phenotypes[$SLURM_ARRAY_TASK_ID]}
