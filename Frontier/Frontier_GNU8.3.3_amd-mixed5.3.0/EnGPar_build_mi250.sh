module load PrgEnv-gnu
module load amd-mixed
export CRAYPE_LINK_TYPE=dynamic

export installroot=$PWD
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export EnGParsrc=$srcroot/EnGPar/
export EnGPar=$installroot/EnGPar/install

cd $installroot
mkdir -p EnGPar/build
cd EnGPar/build
cmake $EnGParsrc -DCMAKE_INSTALL_PREFIX=$EnGPar \
                 -DCMAKE_BUILD_TYPE=Release \
                 -DCMAKE_C_COMPILER=cc \
                 -DCMAKE_CXX_COMPILER=CC \
                 -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PUMI=OFF \
                 -DIS_TESTING=OFF

make install -j4

