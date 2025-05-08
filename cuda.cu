#include <cuda_runtime.h>
#include <cmath>

__global__ void calculate_forces(double* mass, double* x, double* y, double* z,
                                  double* fx, double* fy, double* fz, size_t nbpart, double G) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < nbpart) {
        double Fx = 0.0, Fy = 0.0, Fz = 0.0;

        for (size_t j = 0; j < nbpart; ++j) {
            if (i != j) {
                double dx = x[j] - x[i];
                double dy = y[j] - y[i];
                double dz = z[j] - z[i];
                double dist_sq = dx * dx + dy * dy + dz * dz;
                double dist = sqrt(dist_sq);

                // Gravitational force formula
                double F = G * mass[i] * mass[j] / dist_sq;
                Fx += F * (dx / dist);
                Fy += F * (dy / dist);
                Fz += F * (dz / dist);
            }
        }

        // Store the net forces on particle i
        fx[i] = Fx;
        fy[i] = Fy;
        fz[i] = Fz;
    }
}

__global__ void update_positions_velocities(double* mass, double* x, double* y, double* z,
                                            double* vx, double* vy, double* vz,
                                            double* fx, double* fy, double* fz, size_t nbpart, double dt) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < nbpart) {
        // Update velocity
        vx[i] += (fx[i] / mass[i]) * dt;
        vy[i] += (fy[i] / mass[i]) * dt;
        vz[i] += (fz[i] / mass[i]) * dt;

        // Update position
        x[i] += vx[i] * dt;
        y[i] += vy[i] * dt;
        z[i] += vz[i] * dt;
    }
}
