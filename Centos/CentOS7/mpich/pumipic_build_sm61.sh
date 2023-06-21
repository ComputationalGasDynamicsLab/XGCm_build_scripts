cuda=/usr/local/cuda-11.7
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

# Cabana
export cabana=$installroot/cabana/install

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export pumipic=$installroot/pumi-pic/install

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p pumi-pic/build
cd pumi-pic/build

cmake $pumipicsrc -DCMAKE_BUILD_TYPE=Release \
                  -DBUILD_SHARED_LIBS=OFF \
                  -DCMAKE_CXX_COMPILER=mpicxx \
                  -DENABLE_CABANA=ON \
                  -DPS_IS_TESTING=ON \
                  -DIS_TESTING=ON \
                  -DTEST_DATA_DIR=$pumipicsrc/pumipic-data \
                  -DCMAKE_INSTALL_PREFIX=$pumipic \
                  -DCMAKE_CXX_FLAGS="-fPIC" \

make -j4 install
ctest

