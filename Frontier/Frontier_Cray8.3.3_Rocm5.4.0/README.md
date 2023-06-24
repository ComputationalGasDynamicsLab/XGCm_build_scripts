# XGCm build scripts for OLCF Frontier

Configure and building scripts includes:
```
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- kokkos 4.0.01: https://github.com/kokkos/kokkos
```
using `craype/2.7.19`, `Rocm/5.4.0`, `cray-mpich/8.1.23` by loading:
```
module load PrgEnv-cray
module load cmake/3.23.2
module load craype-accel-amd-gfx90a
module load rocm/5.4.0
```
Note:
- `spectrum-mpi` is loaded by default on `Summit`.

Build the libraries in order:
```
 - PETSc
 - kokkos
 - EnGPar
 - omega_h
 - PUMIPic
 - XGCm
```

(0) create a folder, for example `xgcm_install`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   petsc
   kokkos
   EnGPar
   omega_h
   pumi-pic
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvCray_petsc_suse15.sh`;
- run `./arch-frontier.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/ccs/home/zhangc20/frontier/xgcm/petsc PETSC_ARCH=arch-frontier all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./kokkos_build_mi250.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm_petsc3.16.6/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
