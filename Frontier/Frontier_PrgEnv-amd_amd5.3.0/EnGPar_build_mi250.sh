module load PrgEnv-amd
module load amd/5.3.0
module load cmake/3.23.2
module load cray-mpich/8.1.23
module load craype-accel-amd-gfx90a
export CRAYPE_LINK_TYPE=dynamic
export MPICH_GPU_SUPPORT_ENABLED=1

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

make install -j8

