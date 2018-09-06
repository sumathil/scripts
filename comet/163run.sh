#!/bin/bash
#SBATCH -p gpu
#SBATCH --gres=gpu:p100:4
#SBATCH -t 00:40:00
#SBATCH -J MPAS_gpu
#SBATCH -o gpu.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28

export MODULEPATH=/share/apps/gpu/pgi/v17.10/modulefiles:$MODULEPATH

module purge
module load gnubase
module load pgi
module load openmpi
module load netcdf
export PNETCDF=~/pnetcdf/pnetcdf
export PIO=~/pio/pio
#module list                        # Show what modules had been loaded.
#export MODULEPATH=/share/apps/gpu/pgi/v18.4/modulefiles:$MODULEPATH

#module purge
#module load gnubase
#module load pgi/18.4
#module load openmpi/2.1.2
#module load netcdf/4.6.1
 
module list
export PGI_ACC_TIME=1
cd ~/Dycore/benchmark
cp namelist.atmosphere.163k namelist.atmosphere
cp streams.atmosphere.163k streams.atmosphere
mpirun -np 4 ./atmosphere_model
