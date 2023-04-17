# XGCm build scripts for Centos 7 with cuda 12.1 and gcc 11.2.0

Configure and building scripts include:
```
- kokkos 3.7.00: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: c2109d2
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: a1cadc0
- PETSc 3.19.0: https://gitlab.com/petsc/petsc
- XGCm `cz/petsc_3.19.0` branch: https://github.com/SCOREC/xgcm, at commit: 5f7782a
```
using `cudatoolkit/12.1`, `gcc 11.2.0`, `mpich 4.0.2`.

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
   make PETSC_DIR=/users/zhangc20/xgcm/petsc_cuda12.1_gcc11.2 PETSC_ARCH=arch-centos7 all
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
./kokkos_build_sm86.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm/install/xgcm/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.

