#!/bin/bash
#SBATCH -J mriqc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=16g
#SBATCH -t 2:00:00
#SBATCH --mail-type=ALL,ARRAY_TASKS
#SBATCH --mail-user=roedi004@umn.edu
#SBATCH -p small,amdsmall
# make sure that output_logs directory exists!
#SBATCH -o output_logs/mriqc_%A_%a.out
#SBATCH -e output_logs/mriqc_%A_%a.err
#SBATCH -A limko

module load singularity
module load python3
INDEX=${SLURM_ARRAY_TASK_ID}

MRIQC=/home/limko/public/SingularityImages/mriqc_v22.0.6.sif
#MRIQC=/home/limko/shared/Containers/mriqc_v23.0.0.sif
BIDS_DATA=/scratch.global/kolim_eyegaze_bids/BIDS_out
OUT=/scratch.global/kolim_eyegaze_bids/Derivatives/mriqc

# singularity run $MRIQC --version

LABEL=`python get_bids_sub.py --index $INDEX --bids $BIDS_DATA`

singularity run \
	-B $BIDS_DATA:/data \
    -B $OUT:/out \
    $MRIQC \
/data /out participant \
--participant-label $LABEL \
--work-dir /out/work \
--fd_thres 0.3
# --ica


