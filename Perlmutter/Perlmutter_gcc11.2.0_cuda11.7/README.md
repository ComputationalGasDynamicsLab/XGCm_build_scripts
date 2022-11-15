# XGCm build scripts for NERSC Perlmutter

The folder also include a sample run script on Perlmutter with `gcc 11.2.0`.

Configure and building scripts includes:
```
- kokkos 3.4.01: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: f376fad
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- Cabana 0.3.0: https://github.com/ECP-copa/Cabana
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: db2d3ff
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm at latest commit
```
using `cudatoolkit/11.7`, `gcc 11.2.0`, `cray-mpich/8.1.17` by loading:
```
module load PrgEnv-gnu
module load cudatoolkit/11.7
module load craype-accel-nvidia80
module load cmake/3.22.0
```
Note:
- `module load craype-accel-nvidia80` is just to be able to use the `GPU-aware MPI` later: https://docs.nersc.gov/systems/perlmutter/#gpu-aware-mpi.

Build the libraries in order:
```
 - PETSc
 - kokkos
 - EnGPar
 - omega_h
 - cabana
 - PUMIPic
 - XGCm
```

(0) create a folder, for example `xgcm_install`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   EnGPar
   kokkos
   omega_h
   Cabana
   pumi-pic
   petsc
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_cudatoolkit11.7.sh`;
- run `./arch-perlmutter.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/global/u2/z/zhangc20/xgcm/petsc PETSC_ARCH=arch-perlmutter all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./kokkos_build_sm80.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm_opt/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
