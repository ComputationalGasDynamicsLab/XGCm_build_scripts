module load PrgEnv-gnu
module load amd-mixed
export CRAYPE_LINK_TYPE=dynamic

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
             -DCMAKE_CXX_COMPILER=hipcc \
             -DOmega_h_USE_CUDA=OFF \
             -DOmega_h_USE_MPI=OFF \
             -DOmega_h_USE_OpenMP=OFF \
             -DOmega_h_USE_Kokkos=ON \
             -DKokkos_PREFIX=$kk \
             -DCMAKE_INSTALL_PREFIX=$oh

make -j4 install

