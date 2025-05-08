#!/bin/bash
#SBATCH--job-name=nbody_simulation
#SBATCH--partition=GPU
#SBATCH--time=01:00:00
#SBATCH--nodes=1
#SBATCH--ntasks-per-node=1
#SBATCH--gres=gpu:1

module load cuda

# Run the simulation with arguments
./nbody 100000 0.01 50 10 128
