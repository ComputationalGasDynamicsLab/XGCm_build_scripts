module load PrgEnv-amd
module load cmake/3.23.2
module load craype-accel-amd-gfx90a
module load amd/5.3.0
export CRAYPE_LINK_TYPE=dynamic
export MPICH_GPU_SUPPORT_ENABLED=1

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
# note: for kokkos 4.2.00, need to add `-DCMAKE_CXX_STANDARD=17`
cmake $kksrc \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_CXX_COMPILER=CC \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_CXX_EXTENSIONS=OFF \
      -DKokkos_ARCH_VEGA90A=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=OFF \
      -DKokkos_ENABLE_HIP=ON \
      -DKokkos_ENABLE_DEBUG=OFF \
      -DKokkos_ENABLE_TESTS=OFF \
      -DKokkos_ENABLE_EXAMPLES=OFF \
      -DCMAKE_INSTALL_PREFIX=$kk

make -j8 install
