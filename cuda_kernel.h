#ifndef CUDA_KERNEL_H
#define CUDA_KERNEL_H

__global__ void calculate_forces(double *d_mass, double *d_x, double *d_y, double *d_z,
                                  double *d_fx, double *d_fy, double *d_fz, size_t nb, double G);

__global__ void update_positions_velocities(double *d_mass, double *d_x, double *d_y, double *d_z,
                                            double *d_vx, double *d_vy, double *d_vz, double *d_fx, 
                                            double *d_fy, double *d_fz, size_t nb, double dt);

#endif
