# XGCm build scripts for Centos 7

Configure and building scripts include:
```
- kokkos 3.7.01: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: a63aff2
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- Cabana master branch: https://github.com/ECP-copa/Cabana at commit: 59f595bc9
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: a64161c
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm, at commit: 26ead98
```
using `cudatoolkit/11.7.1`, `gcc 7.3.1`, `mpich 3.3.2`.

Build the libraries in order:
```
 - PETSc
 - kokkos
 - EnGPar
 - omega_h
 - Cabana
 - PUMIPic
 - XGCm
```

(0) create a folder, for example `xgcm`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   petsc
   kokkos
   EnGPar
   omega_h
   Cabana
   pumi-pic
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_centos7.sh`;
- run `./arch-centos7.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/hdds1/RPI/xgcm/petsc PETSC_ARCH=arch-centos7 all
  ```

(2) create a new folder called `install` within the `xgcm` directory: `xgcm/install`.

(3) copy the build scripts to the `install` folder and use the build scripts to build each library, including:
```
   kokkos
   EnGPar
   omega_h
   Cabana
   pumi-pic
   xgcm
```
for example:
```
./kokkos_build_sm61.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm/install/xgcm/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
