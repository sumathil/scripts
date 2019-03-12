#!/bin/bash
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
module load intel/17.0.1
module load mpt/2.18
module load ncarcompilers/0.4.1
module load pio/2.3.1
ulimit -s unlimited
module list

cd /glade/work/slaksh/pranay_mpas/MPAS

make clean CORE=atmosphere
make ifort CORE=atmosphere PRECISION=single USE_PIO2=true

