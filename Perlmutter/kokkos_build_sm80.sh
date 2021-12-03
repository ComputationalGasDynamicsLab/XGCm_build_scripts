module load PrgEnv-gnu
module load cpe-cuda
module load cmake/3.20.5
module load cuda/11.3.0

export CRAYPE_LINK_TYPE=dynamic
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
      -DCMAKE_CXX_COMPILER=CC \
      -DKokkos_ARCH_AMPERE80=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=OFF \
      -DKokkos_ENABLE_CUDA=ON \
      -DKokkos_ENABLE_CUDA_LAMBDA=ON \
      -DKokkos_ENABLE_DEBUG=ON \
      -DKokkos_ENABLE_PROFILING=ON \
      -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install
