module load PrgEnv-gnu
module load cudatoolkit/21.9_11.4
module load cpe-cuda
module load craype-accel-nvidia80
module unload craype-network-ofi
module load craype-network-ucx
module unload cray-mpich
module load cray-mpich-ucx/8.1.12
module load cmake/3.22.0

export CRAYPE_LINK_TYPE=dynamic
export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos
export cuda=$CRAY_CUDATOOLKIT_DIR
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
      -DKokkos_ENABLE_DEBUG=OFF \
      -DKokkos_ENABLE_PROFILING=ON \
      -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install
