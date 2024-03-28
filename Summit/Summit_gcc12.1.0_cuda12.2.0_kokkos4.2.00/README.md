# XGCm build scripts for OLCF Summit

The folder also include a sample run script on Summit.

Configure and building scripts includes:
```
- kokkos 4.2.00: https://github.com/kokkos/kokkos
- omega_h master branch: https://github.com/SCOREC/omega_h, at commit: 08e643b
- EnGPar master branch: https://github.com/SCOREC/EnGPar, at commit: 57b3f57
- Cabana master branch: https://github.com/ECP-copa/Cabana, at commit: 9cc3824
- PUMIPic master branch: https://github.com/SCOREC/pumi-pic, at commit: 7b55b1b
- PETSc 3.16.6: https://gitlab.com/petsc/petsc
- XGCm master branch: https://github.com/SCOREC/xgcm at commit: f284d20
```
using `gcc 12.1.0`, `cuda/12.2.0`, `spectrum-mpi/10.4.0.6-20230210` by loading:
```
module load gcc/12.1.0
module load cuda/12.2.0
module load cmake/3.27.7
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
- run `./petsc_configure.sh` to configure;
- make/build following the output from `PETSc` configuration, something like this:
  ```
   make PETSC_DIR=/ccs/home/zhangc20/xgcm/xgcm_kokkos4.2.00/petsc PETSC_ARCH=arch-summit all
  ```

(2) create a new folder called `install` within the `xgcm_install` directory: `xgcm_install/install`.

(3) copy the build script to the `install` folder and use the build script to build each library, for example:
```
./kokkos_build_sm70_rhel8.sh
```

(4) the final `XGCm` binary is in the following location: `xgcm_install/install/xgcm/build/test/XGCm`.
This can be then copied to the test case directory (or linked in the run script) to run using the supplied run script.

#### `XGCm` run script:
To run `XGCm` use the `run_xgcm_summit.sh` script with the following `bsub` command:
```
bsub run_xgcm_summit.sh
```
In the below run script:
- To use different number of nodes, change `-nnodes 1` to different values.
- To be consistent with the number of nodes used, change `-n 6` to `number of nodes * 6`.
- The lines starting with `./XGCm` are specific to `XGCm` and can be adjusted accordingly.
```
#!/bin/bash
#BSUB -P FUS157
#BSUB -W 0:60
#BSUB -nnodes 1
#BSUB -J Cyclone-590k
#BSUB -o Cyclone-590k.%J
#BSUB -e Cyclone-590k.%J

module load gcc/12.1.0
module load cuda/12.2.0
jsrun -n 6 -a 1 -c 1 -g 1 --smpiargs "-gpu" \
./XGCm --kokkos-num-threads=1 590kmesh.osh 590kmesh_6.cpn \
1 1 bfs bfs 0 0 0 3 input_xgcm petsc petsc_xgcm_cpu.rc \
-use_gpu_aware_mpi 0
```
