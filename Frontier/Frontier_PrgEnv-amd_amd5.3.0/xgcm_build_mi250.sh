module load PrgEnv-amd
module load amd/5.3.0
module load cmake/3.23.2
module load cray-mpich/8.1.23
module load craype-accel-amd-gfx90a
export CRAYPE_LINK_TYPE=dynamic
export MPICH_GPU_SUPPORT_ENABLED=1

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
export xgcm=$installroot/xgcm_petsc3.16.6/install
export xgcmtestdir=$xgcmsrc/xgc1_data

export PETSC_DIR=$installroot/../petsc_3.16.6
export PETSC_ARCH=arch-perlmutter
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$pumipic:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p xgcm_petsc3.16.6/build
cd xgcm_petsc3.16.6/build

cmake $xgcmsrc -DCMAKE_BUILD_TYPE=RelWithDebInfo \
               -DCMAKE_CXX_COMPILER=CC \
               -DCMAKE_CXX_FLAGS="-g" \
               -DXGCM_USE_HIP=ON \
               -DXGCM_USE_CUDA=OFF \
               -DXGCM_PS_CAB=OFF \
               -DXGCM_GPU_SOLVE=OFF \
               -DXGCM_SNES_SOLVE=OFF \
               -DXGCM_INIT_GENE_PERT=ON \
               -DIS_TESTING=ON \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DCMAKE_INSTALL_PREFIX=$xgcm

make -j8 install
