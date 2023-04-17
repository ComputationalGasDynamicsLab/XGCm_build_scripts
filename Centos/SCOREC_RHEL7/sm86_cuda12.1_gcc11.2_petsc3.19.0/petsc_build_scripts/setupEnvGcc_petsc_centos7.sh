module unuse /opt/scorec/spack/lmod/linux-rhel7-x86_64/Core 
module use /opt/scorec/spack/v0181_1/lmod/linux-rhel7-x86_64/Core 
module load gcc/11.2.0
module load mpich/4.0.2
module load cmake
module load valgrind/3.19.0
module load hdf5/1.12.2
module load netlib-scalapack/2.2.0
module load hypre/2.26.0-int32
module load parmetis/4.0.3-int32

cuda=/usr/local/cuda-12.1
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export srcroot=$PWD

export PETSC_DIR=$srcroot
export PETSC_ARCH=arch-centos7
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
