module load cuda11.8/toolkit/11.8.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2

export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# omega_h
export oh=$installroot/omega_h/install
# particle structure
export ps=$installroot/particle_structures/install

#EnGPar
export EnGPar=$installroot/EnGPar/install

# cabana
export cabana=$installroot/cabana/install

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export pumipic=$installroot/pumi-pic/install

# xgcm
export xgcmsrc=$srcroot/xgcm
export xgcm=$installroot/xgcm_petsc_3.16.6/install
export xgcmtestdir=$xgcmsrc/xgc1_data

export PETSC_DIR=$installroot/../petsc
export PETSC_ARCH=arch-polaris
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$pumipic:$CMAKE_PREFIX_PATH
export MPICH_CXX=$kksrc/bin/nvcc_wrapper


cd $installroot
mkdir -p xgcm_petsc_3.16.6/build
cd xgcm_petsc_3.16.6/build

# below is just a simple way to handle a strange issue, when rebuilding,
# g++: error: unrecognized command-line option '-rpath'
rm CMakeCache.txt
cmake $xgcmsrc -DCMAKE_BUILD_TYPE=RelWithDebInfo \
               -DCMAKE_CXX_COMPILER=mpicxx \
               -DIS_TESTING=OFF \
	       -DCMAKE_INSTALL_PREFIX=$xgcm \
               -DXGCM_GPU_SOLVE=OFF \
	       -DXGCM_INIT_GENE_PERT=ON \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DXGCM_SNES_SOLVE=OFF \
               -DXGCM_PS_CAB=OFF \
               -DCMAKE_CXX_FLAGS="-g"

make -j8 install
