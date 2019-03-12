#!/bin/tcsh
# LSF batch script to run an MPI application
#
#PBS -A NTDD0002
#PBS -l walltime=04:00:00
#PBS -l select=1:ncpus=1:mpiprocs=1
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
module list

cd /gpfs/fs1/work/slaksh/pranay_mpas/benchmark/

mpiexec_mpt dplace -s 1  ./atmosphere_model
