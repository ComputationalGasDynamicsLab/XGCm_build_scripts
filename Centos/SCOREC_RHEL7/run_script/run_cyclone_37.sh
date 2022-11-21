module use /opt/scorec/spack/dev/lmod/linux-rhel7-x86_64/Core
module load gcc/7.4.0-c5aaloy
module load mpich/3.3.1-bfezl2l

mpirun -np 4  ./xgcm/build/test/XGCm --kokkos-threads=1 \
../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/37kmesh.osh \
../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/37kmesh_4.cpn \
1 1 bfs bfs 1 1 0 3 \
../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/input_xgcm petsc \
../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/petsc_xgcm.rc \
-use_gpu_aware_mpi 0
