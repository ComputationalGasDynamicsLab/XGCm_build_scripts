module load cudatoolkit/11.5
module load craype-accel-nvidia80
module unload craype-network-ofi
module load craype-network-ucx
module unload cray-mpich
module load cray-mpich-ucx/8.1.13
module load cmake/3.22.0

export cuda=$CRAY_CUDATOOLKIT_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
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

make install -j4

