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

# cabana
export cabanasrc=$srcroot/Cabana/
export cabana=$installroot/cabana/install

export CMAKE_PREFIX_PATH=$kk:$CMAKE_PREFIX_PATH


cd $installroot
mkdir -p cabana/build
cd cabana/build
cmake $cabanasrc -DCMAKE_BUILD_TYPE=Release \
                 -DCMAKE_CXX_COMPILER=CC \
                 -DCMAKE_INSTALL_PREFIX=$cabana

make -j8 install

