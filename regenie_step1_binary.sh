#!/bin/bash

# Extract Phenotype
target_pheno=$(echo $1 | cut -f1 -d".")


# Run step1
./regenie \
  --step 1 \
  --bed /path/UKB_500K_WGS_common_step1 \
  --exclude /path/variant_exclusions.txt\
  --phenoFile /path/phenotype_file.binary.txt\
  --phenoCol ${target_pheno}\
  --covarFile /path/UKB_WGS_covariates.txt \
  --catCovarList ge_wgs_batch \
  --bsize 1000 \
  --force-step1 \
  --loocv \
  --bt --lowmem \
  --lowmem-prefix path/slurm/step1_${target_pheno}_temp\
  --out /path/${target_pheno}/step1



# Sleep for 1 minute
sleep 60s