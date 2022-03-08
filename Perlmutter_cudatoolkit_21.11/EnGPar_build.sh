module load PrgEnv-gnu
module load cudatoolkit/21.11_11.5
module load cpe-cuda
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
export kksrc=$srcroot/kokkos

export EnGParsrc=$srcroot/EnGPar/
export EnGPar=$installroot/EnGPar/install

export OMPI_CXX=$kksrc/bin/nvcc_wrapper

cd $installroot
mkdir -p EnGPar/build
cd EnGPar/build
cmake $EnGParsrc -DCMAKE_INSTALL_PREFIX=$EnGPar -DCMAKE_C_COMPILER=cc \
                 -DCMAKE_BUILD_TYPE=Release \
                 -DCMAKE_CXX_COMPILER=CC -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PARMETIS=OFF -DENABLE_PUMI=OFF -DIS_TESTING=OFF

make install -j4

