#!/bin/bash

#SBATCH --job-name=Matlab
#SBATCH --nodes=20
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=168:00:00

module purge
module load matlab/2022b

export MATLAB_PREFDIR=$(mktemp -d $SLURM_JOBTMP/matlab-XXXX)
export MATLAB_LOG_DIR=$SLURM_JOBTMP

cat<<EOF | matlab -nodisplay

parpool('local', 20)

main

exit

EOF





