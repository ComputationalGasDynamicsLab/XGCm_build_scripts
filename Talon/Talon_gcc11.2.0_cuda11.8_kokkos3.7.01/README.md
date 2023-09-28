# XGCm build scripts for UND Talon cluster

The folder also include a sample run script on Talon with `gcc 11.2.0`.

Configure and building scripts includes:
```
- kokkos 3.7.01: https://github.com/kokkos/kokkos
- omega_h `reducedThrust` branch: https://github.com/SCOREC/omega_h, at commit: e1be29b
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 86e5fa5
- Cabana master branch: https://github.com/ECP-copa/Cabana, at commit: ca6d9bd
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: d6a53c5
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm at commit: 7ba8853
```
using `cuda11.8/toolkit/11.8.0`, `gcc 11.2.0`, `mpich 3.3.2` by loading:
```
module load cuda11.8/toolkit/11.8.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2
```
With this, the loaded modules are:
```
 1) shared                3) gcc/11.2.0                5) cmake/3.21.3           
 2) slurm/slurm/23.02.2   4) cuda11.8/toolkit/11.8.0   6) mpich/ge/gcc/64/3.3.2 
```
Note: `gcc 11.2.0` is loaded by default.

Build the libraries in order:
```
 - kokkos
 - EnGPar
 - omega_h
 - cabana
 - PUMIPic
 - PETSc
 - XGCm
```

(0) create a folder, for example `xgcm_install`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   kokkos
   EnGPar
   omega_h
   Cabana
   pumi-pic
   petsc
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_cudatoolkit11.8.sh`;
- run `./arch-talon.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/home/chonglin.zhang/xgcm/petsc PETSC_ARCH=arch-talon all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./kokkos_build_sm80.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm_petsc_3.16.6/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.

Note for building with OpenMP:
 - in `kokkos` build script, change `-DKokkos_ENABLE_OPENMP=OFF` to `-DKokkos_ENABLE_OPENMP=ON`;
 - in `omega_h` build script, add `-DOmega_h_USE_OpenMP=ON` to cmake;
 - normally in `XGCm` build, OpenMP is not used.
