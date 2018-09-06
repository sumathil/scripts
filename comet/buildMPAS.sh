#!/bin/bash 

#SBATCH -p gpu
#SBATCH --gres=gpu:p100:4
##SBATCH --ntasks-per-node=7
#SBATCH -t 00:20:00
#SBATCH -J CUDA
#SBATCH -o gpu.bat


#export MODULEPATH=/share/apps/gpu/pgi/v18.4/modulefiles:$MODULEPATH
export MODULEPATH=/share/apps/gpu/pgi/v17.10/modulefiles:$MODULEPATH

module purge
module load gnubase
module load pgi
module load openmpi
module load netcdf/4.6.1
module list                        # Show what modules had been loaded.

echo $LD_LIBRARY_PATH
cd /home/slakshmi/mpas_sumathi/MPAS

make clean CORE=atmosphere
make pgi NETCDF=/share/apps/compute/netcdf/pgi/v184 PNETCDF=/home/raghuraj/pnetcdf/pnetcdf PIO=/home/cponder/Environment/Utils/PIO/2018-07-19/PGI-17.10_OpenMPI-3.1.1_NetCDF-F-4.4.4_NetCDF-C-4.6.1_PNetCDF-1.10.0_2018-07-19 CORE=atmosphere PRECISION=single  USE_PIO2=true OPENACC=true
