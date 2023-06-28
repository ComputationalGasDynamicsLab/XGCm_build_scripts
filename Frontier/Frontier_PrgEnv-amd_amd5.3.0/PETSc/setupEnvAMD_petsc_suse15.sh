module load PrgEnv-amd
module load amd/5.3.0
module load cmake/3.23.2
module load cray-mpich/8.1.23
module load craype-accel-amd-gfx90a
module load valgrind4hpc/2.12.11
module load hdf5/1.14.0
export CRAYPE_LINK_TYPE=dynamic
export MPICH_GPU_SUPPORT_ENABLED=1

export installroot=$PWD
export PETSC_DIR=$installroot
export PETSC_ARCH=arch-frontier
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

export OMPI_CXX=CC
export OMPI_CC=cc
export OMPI_FC=ftn
