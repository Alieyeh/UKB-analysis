#!/bin/bash

#SBATCH --job-name=Step22
#SBATCH --time=90:00:00
#SBATCH --mem=400G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --array=0-47
#SBATCH --output=/path/slurm/file_%j.out


# Read quant pheontypes into array
mapfile -t phenotypes <phenotype_quant.txt


# Run main code with vars
script="regenie_step2_quan.sh"
source $script ${phenotypes[$SLURM_ARRAY_TASK_ID]}
