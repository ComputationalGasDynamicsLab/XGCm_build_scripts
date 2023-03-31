module load PrgEnv-cray
module load cmake/3.23.2
module load craype-accel-amd-gfx90a
module load rocm/5.4.0

export installroot=$PWD
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export EnGParsrc=$srcroot/EnGPar/
export EnGPar=$installroot/EnGPar/install

cd $installroot
mkdir -p EnGPar/build
cd EnGPar/build
cmake $EnGParsrc -DCMAKE_INSTALL_PREFIX=$EnGPar \
                 -DCMAKE_C_COMPILER="cc" \
                 -DCMAKE_CXX_COMPILER="CC" \
                 -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PARMETIS=OFF \
                 -DENABLE_PUMI=OFF \
                 -DIS_TESTING=OFF

make install -j4

