#!/bin/sh

module load cmake/3.12.0
module load openmpi/2.0.4.1.1_gnu
module load cuda/9.2
module load gcc/6.3.0

export OMPI_CXX=/home/xinzhewu/softwares/trilinos-final/Trilinos-source/Trilinos-trilinos-release-12-12-branch/packages/kokkos/config/nvcc_wrapper
export NVCC_WRAPPER_DEFAULT_COMPILER=/apps/gcc/6.3/bin/g++
export CUDA_LAUNCH_BLOCKING=1

