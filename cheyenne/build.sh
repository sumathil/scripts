#!/bin/tcsh
#
# LSF batch script to run an MPI application
#
#PBS -A NTDD0002
#PBS -l walltime=00:15:00
#PBS -l select=1:ncpus=1:mpiprocs=1
###:ompthreads=1
#PBS -N MPAS
#PBS -o baseCode1.out
#PBS -e baseCode1.err
#PBS -q regular

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

cd /glade/p_old/work/slaksh/cheyenne/MPAS_Physics/MPAS

make clean CORE=atmosphere
make ifort CORE=atmosphere PRECISION=single USE_PIO2=true

ln -s /glade/p_old/work/slaksh/cheyenne/MPAS_Physics/MPAS/atmosphere_model /glade/p_old/work/slaksh/cheyenne/MPAS_Physics/benchmark
