module load nvhpc/22.5
module load cmake/3.20.2

export cuda=$CUDA_DIR
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
cmake $EnGParsrc -DCMAKE_INSTALL_PREFIX=$EnGPar -DCMAKE_C_COMPILER="mpicc" \
                 -DCMAKE_CXX_COMPILER="mpicxx" -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PARMETIS=OFF -DENABLE_PUMI=OFF -DIS_TESTING=OFF

make install -j4

