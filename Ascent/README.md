# XGCm build scripts for OLCF Ascent
Configure and building scripts includes:
```
- kokkos 3.1.01
- omega_h master branch
- EnGPar
- Cabana branch https://github.com/ECP-copa/Cabana.git
- PUMIPic master branch
- PETSc 3.16.1
- XGCm branch cz/perlmutter
```

Note:
- Cabana is only used to test the `AoSoA` data structure for `gyroScatterEFF` kernel;
- It is not needed for normal XGCm simulation.
