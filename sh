#!/bin/bash

#SBATCH --time=60:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --job-name=Cowles4_10000
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shan.@osu.edu
#SBATCH -o stdout.out_Cowles4_10000
#SBATCH -e stderr.out_Cowles4_10000
#SBATCH --partition=stat

# The following is an example of a single-processor sequential job that uses $TMPDIR as its working area.
# This batch script copies the script file and input file from the directory the
# sbatch command was called from into $TMPDIR, runs the code in $TMPDIR,
# and copies the output file back to the original directory.
#
# Move to the directory where the job was submitted
#
cd $SLURM_SUBMIT_DIR

# COMMANDS TO RUN
ml gnu/9.1.0
ml R/4.1
Rscript Cow4.R

# Now, copy data (or move) back once the simulation has completed
#
cp message.out $SLURM_SUBMIT_DIR
