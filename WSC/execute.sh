#!/bin/bash
# Begin LSF Directives
#BSUB -q excl
#BSUB -W 3:00
#BSUB -nnodes 1  ##number of nodes
#BSUB -alloc_flags gpumps
#BSUB -J mpas
#BSUB -o mpas.out%J
#BSUB -e mpas.err%J

echo $LD_LIBRARY_PATH
cd /gpfs/wscgpfs01/ssuresh/sumathi
. setup
module load cuda
nvidia-smi
cd /gpfs/wscgpfs01/ssuresh/sumathi/MPAS-A_benchmark_120km_L56_v5.2
ulimit -a

## --nrs = number of nodes(resources), tasks_per_rs = number of MPI ranks/resource(node), cpu_per_rs = 7*tasks_per_rs, gpus_per_rs = number of gpus(# of MPI ranks)/resource(node)

jsrun --smpiargs="-gpu" -D CUDA_VISIBLE_DEVICES --nrs 1 --tasks_per_rs 1 --cpu_per_rs 7 --gpu_per_rs 1 --rs_per_host 1 --launch_distribution packed --bind packed:7 ./atmosphere_model
