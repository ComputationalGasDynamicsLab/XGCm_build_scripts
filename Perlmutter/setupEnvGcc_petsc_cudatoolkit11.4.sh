module load PrgEnv-gnu
module load cudatoolkit/21.9_11.4
module load cpe-cuda
module unload craype-network-ofi
module load craype-network-ucx
module unload cray-mpich
module load cray-mpich-ucx/8.1.12
module load cmake/3.22.0
module load valgrind4hpc/2.12.4

export cuda=$CRAY_CUDATOOLKIT_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export PETSC_DIR=$installroot
export PETSC_ARCH=arch-perlmutter
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

export OMPI_CXX=CC
export OMPI_CC=cc
export OMPI_FC=ftn
