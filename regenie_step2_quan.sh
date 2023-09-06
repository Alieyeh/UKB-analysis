#!/bin/bash

# Extract Phenotype
target_pheno=$(echo $1 | cut -f1 -d".")

#set path
# output_step="/path/${target_pheno}"

# ****** REMOVE THIS FOR THE OTHER TWO ******
# make directories
# mkdir -p "$output_step"

# Run step2
./regenie \
  --step 2 \
  --pgen /path/c3 \
  --exclude /path/variant_exclusions_1e-100_allfails.txt \
  --phenoFile /path/phenotype_file.quantitative.txt\
  --phenoCol ${target_pheno}\
  --covarFile /path/UKB_WGS_covariates.txt \
  --catCovarList ge_wgs_batch \
  --pred /path/${target_pheno}/step1_pred.list \
  --anno-file /path/anno_file_3.tsv \
  --set-list /path/set_list_3.tsv \
  --mask-def /path/mask_def_3.tsv \
  --write-mask-snplist\
  --aaf-bins 0.01,0.001,0.0001\
  --joint minp,acat,sbat\
  --out /path/${target_pheno}/step2_3


# Sleep for 1 minute
sleep 60s