# N-body Simulation with CUDA

This repository contains an N-body simulation that computes the gravitational interactions between particles using CUDA. The simulation is designed to model the movement of particles under mutual gravitational forces, commonly used in astrophysics simulations.

## Requirements

- **CUDA**: Ensure that CUDA is installed and properly configured for your system.
- **NVIDIA GPU**: A compatible NVIDIA GPU is required for the CUDA functionality.
- **Make**: Used for building the project.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Idacost/nbody-gpu.git
   cd nbody-gpu

2. Build the project:
   ```bash
   make

3. Run Simulation
   ```bash
    ./nbody <input> <dt> <nbstep> <printevery>

