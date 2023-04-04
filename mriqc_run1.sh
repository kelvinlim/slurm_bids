#! /usr/bin/env bash

module load singularity

MRIQC=/home/limko/public/SingularityImages/mriqc_v22.0.6.sif
#MRIQC=/home/limko/shared/Containers/mriqc_v23.0.0.sif
BIDS_DATA=/scratch.global/kolim_eyegaze_bids/BIDS_out
OUT=/scratch.global/kolim_eyegaze_bids/Derivatives/mriqc

# singularity run $MRIQC --version

singularity run \
	-B $BIDS_DATA:/data \
    -B $OUT:/out \
    $MRIQC \
/data /out participant \
--participant-label 800 
#–-fd_thres 0.3 \
#-w /out/wdir
