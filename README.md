# slurm_bids

Sample code for using slurm to run bids app containers on an HPC.

## Building bids app containers using singularity

singularity can build containers on the HPC.  
```
# need more memory to build container
$ srun -N 1 -n 6 -c 1 --mem-per-cpu=16gb -t 24:00:00 -p interactive --pty bash
$ singularity build mriqc_v22.0l.6.simg  docker://nipreps/mriqc:22.0.6

```

Site for nipreps docker containers: https://hub.docker.com/u/nipreps

can check here for available versions.

fmriprep.org

## To run a batch mriqc job with job array

The main argument is the path to the main directory that contains the
BIDS_out and Derivatives directories.

```
# start the batch
sbatch --array=1-85 slurm_run_mriqc.sh /path_to_main_dir

% sbatch --array=3 slurm_run_mriqc.sh /scratch.global/kolim_covid

# check queue
squeue -u kolim


```

## to run the mriqc group command

```
# don't need to batch this
./mriqc_group.sh /path_to_main_dir

```