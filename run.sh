#!/bin/bash

#SBATCH --comment "Hello ROMEO!"
#SBATCH -J "TEST 1"

#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

#SBATCH --time=02:30:00

#SBATCH -n 4
#SBATCH -N 4
#SBATCH --ntasks-per-node=1
#SBATCH -p short
#SBATCH --gres=gpu:2
#SBATCH --gres-flags=enforce-binding

#srun echo "$CUDA_VISIBLE_DEVICES"

#srun hostname

OMP_NUM_THREADS=1 OMP_PROC_BIND=spread OMP_PLACES=threads mpirun -np 4 ./bgmres.exe --ksp-verbose --ksp-frequency=-1


