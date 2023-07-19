# XGCm build scripts for ALCF Polaris

The folder also include a sample run script on Perlmutter with `gcc 11.2.0`.

Configure and building scripts includes:
```
- kokkos 4.1.00: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: e1be29b
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- Cabana 0.5.0: https://github.com/ECP-copa/Cabana
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: 68c4064
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm at commit: 8345623
```
using `cudatoolkit-standalone/11.8.0`, `gcc 11.2.0`, `cray-mpich/8.1.16` by loading:
```
module load PrgEnv-gnu/8.3.3
module load cudatoolkit-standalone/11.8.0
module load cmake/3.23.2
```
With this, the loaded modules are:
```
  1) craype-x86-rome          5) craype-accel-nvidia80   9) cray-mpich/8.1.16    13) cray-libpals/1.1.7
  2) libfabric/1.11.0.4.125   6) gcc/11.2.0             10) cray-pmi/6.1.2       14) PrgEnv-gnu/8.3.3
  3) craype-network-ofi       7) craype/2.7.15          11) cray-pmi-lib/6.0.17  15) cudatoolkit-standalone/11.8.0
  4) perftools-base/22.05.0   8) cray-dsmml/0.2.2       12) cray-pals/1.1.7      16) cmake/3.23.2
```

Note:
- `craype-accel-nvidia80` is loaded by defaut on ALCF Polaris system.

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

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm_petsc_3.16.6/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.

Note for building with OpenMP:
 - in `kokkos` build script, change `-DKokkos_ENABLE_OPENMP=OFF` to `-DKokkos_ENABLE_OPENMP=ON`;
 - in `omega_h` build script, add `-DOmega_h_USE_OpenMP=ON` to cmake;
 - normally in `XGCm` build, OpenMP is not used.
