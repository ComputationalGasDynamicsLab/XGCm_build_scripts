module use /opt/scorec/spack/dev/lmod/linux-rhel7-x86_64/Core
module load gcc/7.4.0-c5aaloy
module load cmake
module load mpich/3.3.1-bfezl2l

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

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export pumipic=$installroot/pumi-pic/install

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p pumi-pic/build
cd pumi-pic/build

cmake $pumipicsrc -DCMAKE_BUILD_TYPE=Release \
                  -DBUILD_SHARED_LIBS=OFF \
                  -DCMAKE_CXX_COMPILER=mpicxx \
                  -DCMAKE_CXX_FLAGS="-fPIC" \
                  -DENABLE_CABANA=OFF \
                  -DPS_IS_TESTING=ON \
                  -DCMAKE_INSTALL_PREFIX=$pumipic \

make -j4 install
ctest

