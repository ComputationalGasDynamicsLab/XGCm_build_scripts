module load PrgEnv-gnu/8.3.3
module load cudatoolkit-standalone/11.8.0
module load cmake/3.23.2

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
export testdir=$pumipicsrc/pumipic-data
export pumipic=$installroot/pumi-pic/install

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p pumi-pic/build
cd pumi-pic/build
cmake $pumipicsrc -DCMAKE_BUILD_TYPE=Release \
                  -DCMAKE_CXX_COMPILER=CC \
                  -DENABLE_CABANA=ON \
                  -DIS_TESTING=OFF \
                  -DCMAKE_INSTALL_PREFIX=$pumipic \
                  -DTEST_DATA_DIR=$testdir


make -j8 install
