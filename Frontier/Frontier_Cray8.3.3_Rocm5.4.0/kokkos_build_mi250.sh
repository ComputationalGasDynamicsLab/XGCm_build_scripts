module load PrgEnv-cray
module load cmake/3.23.2
module load craype-accel-amd-gfx90a
module load rocm/5.4.0

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc \
      -DCMAKE_CXX_COMPILER=CC \
      -DKokkos_ARCH_VEGA90A=ON \
      -DKokkos_ENABLE_SERIAL=ON \
      -DKokkos_ENABLE_OPENMP=off \
      -DKokkos_ENABLE_HIP=ON \
      -DKokkos_ENABLE_DEBUG=ON \
      -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install

