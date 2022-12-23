# Build scripts for XGCm with AmgX on Summit.

- AmgX main branch: https://github.com/NVIDIA/AMGX.
- AmgXWrapper master branch: https://github.com/barbagroup/AmgXWrapper.

Using `gcc 11.2.0`, `cuda/11.5.2`, `spectrum-mpi/10.4.0.3-20210112` by loading:

```
module load gcc/11.2.0
module load cuda/11.5.2
module load cmake/3.23.2
```

Build scripts for the following libraires are the same as the ones [not using AmgX](https://github.com/zhangchonglin/XGCm_build_scripts/tree/main/Summit/Summit_gcc11.2.0_cuda11.5.2):
```
 - kokkos
 - EnGPar
 - omega_h
 - PUMIPic
 - PETSc
```
They are also included in this folder.

After building the above libraries, build XGCm with AmgX support in the following order:
```
 - AmgX
 - AmgXWrapper
 - XGCm
```
