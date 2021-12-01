module load gcc/7.4.0 \
            cuda/10.2.89 \
            cmake/3.18.2 \
            valgrind/3.14.0 \
            hdf5/1.10.4 \
            netlib-lapack/3.8.0 \
            parmetis/4.0.3 \
            metis/5.1.0 \

export cuda=$CUDA_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export PETSC_DIR=$installroot
export PETSC_ARCH=arch-ascent
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

export OMPI_CXX=g++
export OMPI_CC=gcc
export OMPI_FC=gfortran
