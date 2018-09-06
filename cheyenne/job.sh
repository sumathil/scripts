#!/bin/tcsh
#PBS -A NTDD0002
#PBS -l walltime=02:00:00
#PBS -N MPAS
#PBS -o MPAS.out
#PBS -e MPAS.err
#PBS -q regular
#PBS -l select=1:ncpus=36:mpiprocs=36
##:ompthreads=1

module purge
module load ncarenv/1.2
module load cmake/3.9.1
module load intel/17.0.1
module load ncarcompilers/0.4.1
module load mpt/2.15f
module load netcdf-mpi/4.4.1.1
module load pnetcdf/1.8.0
module load ncl/6.4.0
module list

setenv PIO /glade/p_old/work/duda/pio2-intel17.0.1

cd /glade/p_old/work/slaksh/cheyenne/MPAS_Physics/benchmark/ 

#run the executable
mpiexec_mpt dplace -s 1  ./atmosphere_model
#mpiexec.lsf ./atmosphere_model
