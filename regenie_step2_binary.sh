#!/bin/bash

# Extract Phenotype
target_pheno=$(echo $1 | cut -f1 -d".")

#set path
# output_step="/pah/${target_pheno}"

# make directories
# mkdir -p "$output_step"

# Run step2
./regenie \
  --step 2 \
  --pgen /path/c2 \
  --exclude /path/variant_exclusions_1e-100_allfails.txt \
  --phenoFile /path/phenotype_file.binary.txt\
  --phenoCol ${target_pheno}\
  --covarFile /path/UKB_WGS_covariates.txt \
  --catCovarList ge_wgs_batch \
  --pred /path/${target_pheno}/step1_pred.list \
  --anno-file /path/anno_file_2.tsv \
  --set-list /path/set_list_2.tsv \
  --mask-def /path/mask_def_2.tsv \
  --bt \
  --firth --approx \
  --aaf-bins 0.01,0.001,0.0001\
  --joint minp,acat,sbat\
  --write-mask-snplist\
  --out /path/${target_pheno}/step2_2


# Sleep for 1 minute
sleep 60s