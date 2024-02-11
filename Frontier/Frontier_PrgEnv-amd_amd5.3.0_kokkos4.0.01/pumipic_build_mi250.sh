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

#EnGPar
export EnGPar=$installroot/EnGPar/install

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export testdir=$pumipicsrc/pumipic-data
export pumipic=$installroot/pumi-pic/install

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p pumi-pic/build
cd pumi-pic/build

cmake $pumipicsrc -DCMAKE_BUILD_TYPE=RelWithDebInfo \
                  -DCMAKE_CXX_COMPILER=CC \
                  -DIS_TESTING=ON \
                  -DPS_IS_TESTING=ON \
                  -DTEST_DATA_DIR=$testdir \
                  -DCMAKE_INSTALL_PREFIX=$pumipic

make -j8 install

