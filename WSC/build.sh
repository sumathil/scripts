#!/bin/bash

cd /gpfs/wscgpfs01/ssuresh/gtc
. setup
cd /gpfs/wscgpfs01/ssuresh/gtc/MPAS 
make clean CORE=atmosphere
make pgi CORE=atmosphere OPENACC=true PRECISION=single USE_PIO2=true
