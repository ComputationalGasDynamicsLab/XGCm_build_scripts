module load PrgEnv-gnu
module load cudatoolkit/11.7
module load craype-accel-nvidia80
module load cmake/3.22.0
module unload darshan
module list

export cuda=$CRAY_CUDATOOLKIT_DIR
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

# cabana
export cabana=$installroot/cabana/install

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export pumipic=$installroot/pumi-pic/install

# xgcm
export xgcmsrc=$srcroot/xgcm
export xgcm=$installroot/xgcm_opt/install
export xgcmtestdir=$xgcmsrc/xgc1_data

# AmgX
export amgxsrc=$srcroot/amgx
export amgx=$installroot/amgx/

#AmgXWrapper
export amgx_wrapper_src=$srcroot/AmgXWrapper
export amgx_wrapper=$installroot/amgx_wrapper/build

export PETSC_DIR=$installroot/../petsc_cuda11.7/
export PETSC_ARCH=arch-perlmutter
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$pumipic:$CMAKE_PREFIX_PATH
export OMPI_CXX=$kksrc/bin/nvcc_wrapper


cd $installroot
mkdir -p xgcm_amgx_opt/build
cd xgcm_amgx_opt/build

cmake $xgcmsrc -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=CC \
               -DIS_TESTING=OFF -DCMAKE_INSTALL_PREFIX=$xgcm \
               -DXGCM_GPU_SOLVE=ON -DXGCM_INIT_GENE_PERT=OFF \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DXGCM_SNES_SOLVE=OFF \
               -DXGCM_PS_CAB=ON \
               -DCMAKE_CXX_FLAGS="-g -I$amgx_wrapper/include -I$amgx/include"

make -j16 install
