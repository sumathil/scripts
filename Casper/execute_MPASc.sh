#!/bin/bash -l

#SBATCH -J MPAS_gpu
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --tasks-per-node=4
#SBATCH -t 04:00:00
#SBATCH -p dav
#SBATCH -A NTDD0002
#SBATCH --gres=gpu:v100:4
#SBATCH -o gpu.out
#SBATCH --mem=0
#SBATCH --exclusive


module purge
export PATH=/glade/work/ssuresh/1810pgi/linux86-64/18.10/bin/:$PATH
export LD_LIBRARY_PATH=/glade/work/ssuresh/1810pgi/linux86-64/18.10/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/glade/work/ssuresh/1810pgi/linux86-64/18.10/mpi/openmpi-2.1.2/lib/:$LD_LIBRARY_PATH
export PATH=/glade/work/ssuresh/1810pgi/linux86-64/18.10/mpi/openmpi-2.1.2/bin/:$PATH
which mpif90

export PNETCDF=/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/
export NETCDF=/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/
export PIO=/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/
export MPAS_EXTERNAL_LIBS="-L/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/lib/ -lhdf5_hl -lhdf5 -ldl -lz"
export MPAS_EXTERNAL_INCLUDES="-I/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/include"
ulimit -s unlimited
module list
env
sinfo

echo $LD_LIBRARY_PATH
cd /glade/scratch/slaksh/mcworkshop/benchmark

echo $LDFLAGS
export PGI_ACC_TIME=1

#the n argument here is number of tasks per node,
export OMPI_MCA_btl_openib_if_include=mlx5_0
#srun --mem=0 --mpi=pmix -N 1 --ntasks-per-node 4 ./atmosphere_model
srun --mem=0 --mpi=pmix ./atmosphere_model



