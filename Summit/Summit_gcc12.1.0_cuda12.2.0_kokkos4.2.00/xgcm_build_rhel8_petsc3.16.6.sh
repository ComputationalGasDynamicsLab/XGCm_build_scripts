module load gcc/12.1.0
module load cuda/12.2.0
module load cmake/3.27.7

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
export xgcm=$installroot/xgcm/install
export xgcmtestdir=$xgcmsrc/xgc1_data

export PETSC_DIR=/ccs/home/zhangc20/xgcm/xgcm_kokkos3.7.02/petsc
export PETSC_ARCH=arch-summit
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$pumipic:$CMAKE_PREFIX_PATH
export OMPI_CXX=$kksrc/bin/nvcc_wrapper


cd $installroot
mkdir -p xgcm/build
cd xgcm/build

cmake $xgcmsrc -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=mpicxx \
               -DIS_TESTING=OFF -DCMAKE_INSTALL_PREFIX=$xgcm \
               -DXGCM_GPU_SOLVE=OFF -DXGCM_INIT_GENE_PERT=ON \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DXGCM_SNES_SOLVE=OFF -DXGCM_PS_CAB=OFF \
               -DCMAKE_CXX_FLAGS="-g -lineinfo"

make -j4 install

