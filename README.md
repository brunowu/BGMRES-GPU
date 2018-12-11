# BGMRES-GPU
Block GMRES using Kokkos

## Module list

On machine Romeo 2013 with Nvidia K20x cards:

gcc/6.3.0; cmake/3.9.1; cuda/9.0; openmpi/1.10.2

On machine Romeo 2018 with Nvidia P100 cards:

gcc/6.3.0; cmake/3.12.0; cuda/9,2; openmpi/3.1.2 (cuda aware: install with CUDA 9.2)

## Environment variables

export OMPI_CXX=./../Trilinos-trilinos-release-12-12-branch/packages/kokkos/config/nvcc_wrapper

export NVCC_WRAPPER_DEFAULT_COMPILER=./../6.3.0/bin/g++

export CUDA_LAUNCH_BLOCKING=1

## Trilinos install for GPUs

This is an example of script: installromeogpu.sh


