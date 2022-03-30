module load gcc/7.5.0
module load cuda/10.2.89
module load cmake/3.20.2

export cuda=$CUDA_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
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

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export pumipic=$installroot/pumi-pic/install

# xgcm
export xgcmsrc=$srcroot/xgcm
export xgcm=$installroot/xgcm_opt/install
export xgcmtestdir=$xgcmsrc/xgc1_data

export PETSC_DIR=$srcroot/petsc/
export PETSC_ARCH=arch-summit
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$pumipic:$CMAKE_PREFIX_PATH
export OMPI_CXX=$kksrc/bin/nvcc_wrapper


cd $installroot
mkdir -p xgcm_opt/build
cd xgcm_opt/build

cmake $xgcmsrc -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=mpicxx \
               -DIS_TESTING=ON -DCMAKE_INSTALL_PREFIX=$xgcm \
               -DXGCM_GPU_SOLVE=ON -DXGCM_INIT_GENE_PERT=ON \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DXGCM_SNES_SOLVE=OFF \
               -DCMAKE_CXX_FLAGS=-g

make -j8 install

