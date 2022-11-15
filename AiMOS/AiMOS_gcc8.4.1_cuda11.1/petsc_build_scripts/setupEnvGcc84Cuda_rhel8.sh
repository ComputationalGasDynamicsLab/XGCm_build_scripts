module use /gpfs/u/software/dcs-rhel8-spack-install/v0162gccSpectrum/lmod/linux-rhel8-ppc64le/Core/
module load spectrum-mpi/10.4-2ycgnlq
module load \
  cmake/3.20.0/1 \
  cuda/11.1-3vj4c72 \
  netlib-lapack \
  hdf5 \
  parmetis \
  hypre

export OMPI_CXX=g++
export OMPI_CC=gcc
export OMPI_FC=gfortran

export PETSC_DIR=~/barn/pumi-pic/petsc
export PETSC_ARCH=arch-aimos
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
