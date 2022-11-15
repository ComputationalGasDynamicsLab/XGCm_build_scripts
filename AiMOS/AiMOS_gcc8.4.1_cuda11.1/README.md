# XGCm build scripts for RPI AiMOS

The folder also include a sample run script on AiMOS with `gcc 8.4.1`.

Configure and building scripts includes:
```
- kokkos 3.4.01: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: f376fad
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: db2d3ff
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm at latest commit
```
using `cuda/11.1`, `gcc 8.4.1`, `spectrum-mpi/10.4`, and `cmake/3.20.0` by loading:
```
module use /gpfs/u/software/dcs-rhel8-spack-install/v0162gccSpectrum/lmod/linux-rhel8-ppc64le/Core/
module load spectrum-mpi/10.4-2ycgnlq
module load cuda/11.1-3vj4c72
module load cmake/3.20.0/1
```

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
- `source setupEnvGcc84Cuda_rhel8.sh`;
- run `./arch-aimos.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/gpfs/u/home/MPFS/MPFScgzg/barn/pumi-pic/petsc PETSC_ARCH=arch-aimos all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build scripts to the `install` folder and use the build scripts to build each library one by one, for example:
```
./kokkos_build_sm70_rhel8.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
```
./submitAimos.sh
```
User can modify `runAimos.sh` script to run the desired test case.
