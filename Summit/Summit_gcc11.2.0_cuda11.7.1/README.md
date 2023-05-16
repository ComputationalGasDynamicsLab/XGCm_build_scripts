# XGCm build scripts for OLCF Summit

The folder also include a sample run script on Summit.

Configure and building scripts includes:
```
- kokkos 3.7.01: https://github.com/kokkos/kokkos
- kokkos 3.7.01: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: e1be29b
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- Cabana 0.5.0: https://github.com/ECP-copa/Cabana
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: 68c4064
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm at commit: 8345623
```
using `gcc 11.2.0`, `cuda/11.7.1`, `spectrum-mpi/10.4.0.3-20210112` by loading:
```
module load gcc/11.2.0
module load cuda/11.7.1
module load cmake/3.23.2
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
   kokkos
   EnGPar
   omega_h
   pumi-pic
   petsc
   xgcm
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvGcc_petsc_rhel8.sh`;
- run `./arch-perlmutter.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/ccs/home/zhangc20/pumi-pic/petsc_3.16.6 PETSC_ARCH=arch-summit all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./kokkos_build_sm70_rhel8.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm_petsc3.16.6/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
