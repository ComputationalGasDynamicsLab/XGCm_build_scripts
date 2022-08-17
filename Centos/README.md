# XGCm build scripts for Centos 7

Configure and building scripts include:
```
- kokkos 3.4.01: https://github.com/kokkos/kokkos
- omega_h master branch: hhttps://github.com/SCOREC/omega_h, at commit: 11eb25d
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: dd926f3
- PETSc 3.16.2: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm, at commit: fe7fcbf
```
using `cudatoolkit/11.7.1`, `gcc 7.3.1`, `openmpi 4.1.0`.

Build the libraries in order:
```
 - PETSc
 - kokkos
 - EnGPar
 - omega_h
 - PUMIPic
 - XGCm
```

(0) create a folder, for example `xgcm`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   petsc
   kokkos
   EnGPar
   omega_h
   pumi-pic
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_centos7.sh`;
- run `./arch-centos7.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/hdds1/RPI/xgcm/petsc_3.16.2 PETSC_ARCH=arch-centos7 all
  ```

(2) create a new folder called `install` within the `xgcm` directory: `xgcm/install`.

(3) copy the build scripts to the `install` folder and use the build scripts to build each library, including:
```
   kokkos
   EnGPar
   omega_h
   pumi-pic
   xgcm
```
for example:
```
./kokkos_build_sm61.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm/install/xgcm/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.

Note: `Cabana` build script is included, but is not used in XGCm for now (need to use `cz/PS_Cabana` branch of XGCm).
