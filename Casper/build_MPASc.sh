#!/bin/bash -l 
#SBATCH -J MPAS_gpu
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --tasks-per-node=1
#SBATCH -t 00:30:00
#SBATCH -p dav
#SBATCH -A NTDD0002
#SBATCH --gres=gpu:v100:4
#SBATCH -o gpu.out
#SBATCH --mem 16000

module purge
export PATH=/glade/work/ssuresh/1810pgi/linux86-64/18.10/bin/:$PATH
export LD_LIBRARY_PATH=/glade/work/ssuresh/1810pgi/linux86-64/18.10/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/glade/work/ssuresh/1810pgi/openmpi/lib/:$LD_LIBRARY_PATH
export PATH=/glade/work/ssuresh/1810pgi/openmpi/bin/:$PATH


export PNETCDF=/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/
export NETCDF=/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/
export PIO=/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/
export MPAS_EXTERNAL_LIBS="-L/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/lib/ -lhdf5_hl -lhdf5 -ldl -lz"
export MPAS_EXTERNAL_INCLUDES="-I/glade/work/ssuresh/1810pgi/pgi1810_lib/libs-pgi1810/include"
ulimit -s unlimited

echo $LD_LIBRARY_PATH
cd /gpfs/fs1/scratch/slaksh/mcworkshop/MPAS

make clean CORE=atmosphere
make pgi CORE=atmosphere OPENACC=true PRECISION=single USE_PIO2=true
