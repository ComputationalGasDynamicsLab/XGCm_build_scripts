# XGCm build scripts for OLCF Frontier

Configure and building scripts includes:
```
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- kokkos 4.0.01: https://github.com/kokkos/kokkos
- omega_h `reducedThrust` branch: https://github.com/SCOREC/omega_h, at commit: 5e33307
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- PUMIPic `ac/replace-cuda-thrust` branch: https://github.com/SCOREC/pumi-pic, at commit: a37a37b
- XGCm `cz/frontier` branch: https://github.com/SCOREC/xgcm at commit: 61dde9d
```
using `craype/2.7.19`, `PrgEnv-amd/8.3.3` `amd/5.3.0`, `cray-mpich/8.1.23`, and `cmake/3.23.2` by loading:
```
module load PrgEnv-amd
module load amd/5.3.0
module load cmake/3.23.2
module load cray-mpich/8.1.23
module load craype-accel-amd-gfx90a
module load valgrind4hpc/2.12.11
module load hdf5/1.14.0
```
Note: `valgrind4hpc/2.12.11` and `hdf5/1.14.0` are only needed for building `PETSc`.

With above commands, the following modules are loaded:
```
Currently Loaded Modules:
  1) craype-x86-trento    4) perftools-base/22.12.0                  7) craype/2.7.19          10) PrgEnv-amd/8.3.3  13) cmake/3.23.2             16) cray-mpich/8.1.23     19) hdf5/1.14.0
  2) libfabric/1.15.2.0   5) xpmem/2.5.2-2.4_3.45__gd0f7936.shasta   8) cray-dsmml/0.2.2       11) hsi/default       14) craype-accel-amd-gfx90a  17) cray-mrnet/5.0.4
  3) craype-network-ofi   6) cray-pmi/6.1.8                          9) cray-libsci/22.12.1.1  12) DefApps/default   15) amd/5.3.0                18) valgrind4hpc/2.12.11
```
`cmake 3.20.4` is also loaded by default.

Build the libraries in order:
```
 - PETSc
 - kokkos
 - omega_h
 - EnGPar
 - PUMIPic
 - XGCm
```

(0) create a folder, for example `xgcm_install`, and clone all the repository in the folder, all repository in separate folder with the following names:
```
   petsc_3.16.6
   kokkos
   EnGPar
   omega_h
   pumi-pic
   xgcm_petsc3.16.6
```

(1) To build `PETSc`, do the following in the `PETSc` source directory:
- `source setupEnvAMD_petsc_suse15.sh`;
- run `./arch-frontier.py` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/ccs/home/zhangc20/frontier/xgcm/petsc_3.16.6 PETSC_ARCH=arch-frontier all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./kokkos_build_mi250.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm_petsc3.16.6/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.
