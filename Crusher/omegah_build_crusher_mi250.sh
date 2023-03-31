module load PrgEnv-cray
module load cmake/3.23.2
module load craype-accel-amd-gfx90a
module load rocm/5.4.0

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_SHARED_LIBS=OFF \
             -DCMAKE_INSTALL_PREFIX=$oh
             -DOmega_h_USE_Kokkos=ON \
             -DOmega_h_USE_MPI=ON \
             -DCMAKE_CXX_COMPILER=CC \
             -DKokkos_PREFIX=$kk/lib64/cmake/ \
             -DCMAKE_INSTALL_PREFIX=$oh

make -j4 install

