cuda=/usr/local/cuda-11.7
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export OMPI_CXX=/hdds1/RPI/pumi-pic/kokkos/bin/nvcc_wrapper
export PETSC_DIR=/hdds1/RPI/pumi-pic/petsc_3.16.2
export PETSC_ARCH=arch-centos7
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
