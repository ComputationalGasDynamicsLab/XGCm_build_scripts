# XGCm build scripts for OLCF Crusher (incomplete due to PUMIPic not working with AMD GPU)

Configure and building scripts includes:
```
- kokkos 3.4.01: https://github.com/kokkos/kokkos
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- omega_h master branch: https://github.com/SCOREC/omega_h
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic
```
using `rocm/5.4.0`, `Cray` compiler, `cray-mpich/8.1.17` by loading:
```
module load PrgEnv-cray
module load cmake/3.23.2
module load craype-accel-amd-gfx90a
module load rocm/5.4.0
```
Note:
- `module load craype-accel-amd-gfx90a` is just to be able to use the `GPU-aware MPI` later;
- reference: https://docs.olcf.ornl.gov/systems/crusher_quick_start_guide.html#gpu-aware-mpi
- this can be ignored.

Build the libraries in order:
```
 - kokkos
 - EnGPar
 - omega_h
 - PUMIPic
```

(0) create a folder, for example `xgcm_install`, and clone all the repositories in
    the folder, all repositories in separate folders with the following names:
```
   kokkos
   EnGPar
   omega_h
   pumi-pic
```
