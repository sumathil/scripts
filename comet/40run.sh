#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu:p100:4
#SBATCH -t 00:20:00
#SBATCH -J MPAS_gpu_physics
#SBATCH -o physics_gpu.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4

export MODULEPATH=/share/apps/gpu/pgi/v17.10/modulefiles:$MODULEPATH

module purge
module load gnubase
module load pgi
module load openmpi
module load netcdf
export PNETCDF=/home/raghuraj/pnetcdf/pnetcdf
export PIO=/home/raghuraj/pio/pio

module list

cd /home/slakshmi/mpas_sumathi/benchmark
cp namelist.atmosphere.40k.physics namelist.atmosphere
cp streams.atmosphere.40k.physics streams.atmosphere
mpirun -np 4 ./atmosphere_model
