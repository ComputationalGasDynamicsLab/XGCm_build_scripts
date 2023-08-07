module load PrgEnv-gnu/8.3.3
module load cudatoolkit-standalone/11.8.0
module load cmake/3.23.2

export petsc_installroot=$PWD
export PETSC_DIR=$petsc_installroot
export PETSC_ARCH=arch-polaris
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
