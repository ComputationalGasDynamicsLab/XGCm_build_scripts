module load PrgEnv-gnu
module load amd-mixed
export CRAYPE_LINK_TYPE=dynamic

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo\
      -DCMAKE_CXX_COMPILER=hipcc\
      -DCMAKE_CXX_EXTENSIONS=OFF\
      -DKokkos_ENABLE_TESTS=OFF\
      -DKokkos_ENABLE_EXAMPLES=OFF\
      -DKokkos_ENABLE_SERIAL=ON\
      -DKokkos_ENABLE_OPENMP=OFF\
      -DKokkos_ENABLE_HIP=ON\
      -DKokkos_ARCH_VEGA90A=ON\
      -DKokkos_ENABLE_DEBUG=OFF\
      -DCMAKE_INSTALL_PREFIX=$kk

make -j4 install

