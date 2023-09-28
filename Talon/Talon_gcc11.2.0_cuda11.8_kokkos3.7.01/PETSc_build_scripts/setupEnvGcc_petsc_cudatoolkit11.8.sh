module load cuda11.8/toolkit/11.8.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2

export petsc_installroot=$PWD
export PETSC_DIR=$petsc_installroot
export PETSC_ARCH=arch-talon
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
