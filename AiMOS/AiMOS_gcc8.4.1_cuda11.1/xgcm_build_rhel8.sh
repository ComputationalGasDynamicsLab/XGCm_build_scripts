module use /gpfs/u/software/dcs-rhel8-spack-install/v0162gccSpectrum/lmod/linux-rhel8-ppc64le/Core/
module load spectrum-mpi/10.4-2ycgnlq
module load cmake/3.20.0/1
module load cuda/11.1-3vj4c72

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
export testdir=$pumipicsrc/pumipic-data
export pumipic=$installroot/pumi-pic/install

# xgcm
export xgcmsrc=$srcroot/xgcm
export xgcm=$installroot/xgcm/install
export xgcmtestdir=$xgcmsrc/xgc1_data

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$pumipic:$CMAKE_PREFIX_PATH

export PETSC_DIR=~/barn/pumi-pic/petsc
export PETSC_ARCH=arch-aimos
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig

export OMPI_CXX=$kksrc/bin/nvcc_wrapper
export OMPI_CC=gcc


cd $installroot
mkdir -p xgcm/build
cd xgcm/build

cmake $xgcmsrc -DCMAKE_BUILD_TYPE=Release \
               -DCMAKE_CXX_COMPILER=mpicxx \
               -DCMAKE_BUILD_TYPE=Release -DIS_TESTING=OFF \
               -DXGC_DATA_DIR=$xgcmtestdir \
               -DXGCM_GPU_SOLVE=OFF -DXGCM_INIT_GENE_PERT=ON \
               -DCMAKE_INSTALL_PREFIX=$xgcm

make -j4 install
