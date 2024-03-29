module use /opt/scorec/spack/dev/lmod/linux-rhel7-x86_64/Core
module load gcc/7.4.0-c5aaloy
module load cmake/3.20.0
module load mpich/3.3.1-bfezl2l
module load valgrind/3.15.0-4464rs2
module load hdf5/1.10.5-ftn-tb7hfxx
module load netlib-scalapack/2.0.2-yjmafdq
module load hypre/2.18.1-int32-y2p4vsy
module load parmetis/4.0.3-int32-uuza7iv

cuda=/usr/local/cuda-11.7
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export srcroot=$PWD

export PETSC_DIR=$srcroot
export PETSC_ARCH=arch-centos7
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
