cuda=/usr/local/cuda-11.7
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc -DCMAKE_CXX_COMPILER=$kksrc/bin/nvcc_wrapper \
             -DBUILD_SHARED_LIBS=ON \
             -DKokkos_ARCH_AMPERE86=ON \
             -DKokkos_ENABLE_SERIAL=ON \
             -DKokkos_ENABLE_OPENMP=OFF \
             -DKokkos_ENABLE_CUDA=ON \
             -DKokkos_ENABLE_CUDA_LAMBDA=ON \
             -DKokkos_ENABLE_DEBUG=ON \
             -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install


