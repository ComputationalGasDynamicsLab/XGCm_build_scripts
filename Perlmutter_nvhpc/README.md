# XGCm build scripts for NERSC Perlmutter using `nvhpc`

The folder also include a sample run script on Perlmutter.

Configure and building scripts includes:
```
- kokkos 3.4.01: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/sandialabs/omega_h, at commit: a438507
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: 61fbac2
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- PETSc 3.16.2: https://gitlab.com/petsc/petsc
- XGCm cz/perlmutter branch: https://github.com/SCOREC/xgcm, at commit: 96c040d
```
using `cudatoolkit/11.5`, `nvhpc` (`nvidia/21.11`), `cray-mpich/8.1.15` by loading:
```
module load PrgEnv-nvidia
module load cudatoolkit/11.5
module load craype-accel-nvidia80
module load cmake/3.22.0
module load valgrind4hpc/2.12.7
module unload darshan
```
Note:
- `module load craype-accel-nvidia80` is just to be able to use the `GPU-aware MPI` later: https://docs.nersc.gov/systems/perlmutter/#gpu-aware-mpi.
- `cray-mpich/8.1.17` is loaded by default.

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
   EnGPar
   kokkos
   omega_h
   petsc
   pumi-pic
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_cudatoolkit11.5.sh`;
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

(5) Use `CabanaM` particle data structure by default.



