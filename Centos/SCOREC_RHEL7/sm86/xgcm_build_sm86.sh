module unuse /opt/scorec/spack/lmod/linux-rhel7-x86_64/Core 
module use /opt/scorec/spack/v0181_1/lmod/linux-rhel7-x86_64/Core 
module load gcc/11.2.0
module load mpich/4.0.2
module load cmake

cuda=/usr/local/cuda-11.4
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# omega_h
export oh=$installroot/omega_h/install

#EnGPar
export EnGPar=$installroot/EnGPar/install

# pumi-pic
export pumipic=$installroot/pumi-pic/install

# xgcm
export xgcmsrc=$srcroot/xgcm
export xgcm=$installroot/xgcm/install
export xgcmtestdir=$xgcmsrc/xgc1_data

export PETSC_DIR=$srcroot/petsc_cuda11.4_gcc11.2
export PETSC_ARCH=arch-centos7
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$pumipic:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p xgcm/build
cd xgcm/build

cmake $xgcmsrc -DCMAKE_BUILD_TYPE=Debug \
               -DBUILD_SHARED_LIBS=OFF \
               -DCMAKE_CXX_COMPILER=mpicxx \
               -DCMAKE_CXX_FLAGS="-g" \
               -DXGCM_INIT_GENE_PERT=ON \
               -DXGCM_GPU_SOLVE=ON \
               -DXGCM_SNES_SOLVE=OFF \
               -DXGCM_PS_CAB=OFF \
               -DIS_TESTING=ON \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DCMAKE_INSTALL_PREFIX=$xgcm

make -j8 install

ctest
#cmake $xgcmsrc -DCMAKE_BUILD_TYPE=RelWithDebInfo \
