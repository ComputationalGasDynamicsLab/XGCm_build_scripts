module load gcc/11.2.0
module load cuda/11.7.1
module load cmake/3.23.2
module load valgrind/3.17.0
module load hdf5/1.10.7
module load netlib-lapack/3.9.1
# need gcc 9 for parmetis
#module load parmetis/4.0.3
#module load metis/5.1.0

export cuda=$CUDA_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export PETSC_DIR=$installroot
export PETSC_ARCH=arch-summit
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

export OMPI_CXX=g++
export OMPI_CC=gcc
export OMPI_FC=gfortran
