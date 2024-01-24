# XGCm build scripts for Centos 9

Configure and building scripts include:
```
- kokkos 4.2.00: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: c5f1dc9
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 86e5fa5
- Cabana master branch: https://github.com/ECP-copa/Cabana at commit: 9cc3824
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: 35c49f0
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm, at commit: 26ead98
```
using `cudatoolkit/11.7.1`, `gcc 11.4.1`, `mpich 3.4.3`.

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
- `source setupEnvGcc_petsc_centos9.sh`;
- run `./arch-centos9.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/hdd1/xgcm/petsc PETSC_ARCH=arch-centos9 all
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
./kokkos_build.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm/install/xgcm/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
