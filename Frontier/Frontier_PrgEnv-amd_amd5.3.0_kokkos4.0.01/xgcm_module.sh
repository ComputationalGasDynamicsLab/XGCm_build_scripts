module load PrgEnv-amd
module load amd/5.3.0
module load cmake/3.23.2
module load cray-mpich/8.1.23
module load craype-accel-amd-gfx90a
export CRAYPE_LINK_TYPE=dynamic
export MPICH_GPU_SUPPORT_ENABLED=1
