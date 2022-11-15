module use /gpfs/u/software/dcs-rhel8-spack-install/v0162gccSpectrum/lmod/linux-rhel8-ppc64le/Core/
module load spectrum-mpi/10.4-2ycgnlq
module load cmake/3.20.0/1
module load cuda/11.1-3vj4c72 \

export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export EnGPar=$installroot/EnGPar/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos
export EnGParsrc=$srcroot/EnGPar/

export OMPI_CXX=$kksrc/bin/nvcc_wrapper
export OMPI_CC=gcc

cd $installroot
mkdir -p EnGPar/build
cd EnGPar/build
cmake $EnGParsrc -DCMAKE_BUILD_TYPE=Release \
                 -DCMAKE_INSTALL_PREFIX=$EnGPar \
                 -DCMAKE_C_COMPILER="mpicc" -DCMAKE_CXX_COMPILER="mpicxx" \
                 -DCMAKE_CXX_FLAGS="-std=c++11" -DENABLE_PARMETIS=OFF \
                 -DENABLE_PUMI=OFF -DIS_TESTING=OFF

make -j4 install

