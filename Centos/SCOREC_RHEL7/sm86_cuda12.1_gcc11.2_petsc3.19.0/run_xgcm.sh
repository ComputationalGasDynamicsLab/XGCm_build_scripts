mpirun -np 4 ./xgcm/build/test/XGCm --kokkos-num-threads=1 \
../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/37kmesh.osh \
../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/37kmesh_2.cpn \
1 1 full bfs 1 1 0 3 \
./../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/input_xgcm petsc \
./../xgcm/xgc1_data/Cyclone_ITG/Cyclone_ITG_deltaf_37kmesh/petsc_xgcm.rc \
-use_gpu_aware_mpi 0 -log_view_gpu_time -dm_plex_check_all
