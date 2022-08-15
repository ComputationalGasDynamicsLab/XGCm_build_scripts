module load gcc/11.2.0
module load cuda/11.5.2
module load cmake/3.20.2

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos
export cuda=$CUDA_DIR
export OMPI_CXX=$kksrc/bin/nvcc_wrapper
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc \
      -DCMAKE_CXX_COMPILER=mpiCC \
      -DKokkos_ARCH_VOLTA70=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=off \
      -DKokkos_ENABLE_CUDA=on \
      -DKokkos_ENABLE_CUDA_LAMBDA=on \
      -DKokkos_ENABLE_DEBUG=on \
      -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install

