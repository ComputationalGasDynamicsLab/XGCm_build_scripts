# Build scripts for XGCm with AmgX on Summit.

- AmgX main branch: https://github.com/NVIDIA/AMGX.
- AmgXWrapper master branch: https://github.com/barbagroup/AmgXWrapper.

Using `gcc 7.5.0`, `cuda/10.2.89`, `spectrum-mpi/10.4.0.3-20210112` by loading:

```
module load gcc/7.5.0
module load cuda/10.2.89
module load cmake/3.20.2
```

Build scripts for the following libraires are the same as the ones [not using AmgX](https://github.com/zhangchonglin/XGCm_build_scripts/tree/main/Summit):
```
 - kokkos
 - EnGPar
 - omega_h
 - Cabana
 - PUMIPic
 - PETSc
```

After building the above libraries, build XGCm with AmgX support in the following order:
```
 - AmgX
 - AmgXWrapper
 - XGCm
```


### Note:
- xgcm build script with AmgX is not working properly, failing at the final link step;
- currently the final link step is being done manually.
