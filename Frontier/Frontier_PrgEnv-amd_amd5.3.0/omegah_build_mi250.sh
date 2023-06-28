module load PrgEnv-amd
module load amd/5.3.0
module load cmake/3.23.2
module load cray-mpich/8.1.23
module load craype-accel-amd-gfx90a
export CRAYPE_LINK_TYPE=dynamic
export MPICH_GPU_SUPPORT_ENABLED=1

export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc -DCMAKE_BUILD_TYPE=RelWithDebInfo \
             -DBUILD_SHARED_LIBS=OFF \
             -DCMAKE_CXX_COMPILER=CC \
             -DOmega_h_USE_CUDA=OFF \
             -DOmega_h_USE_MPI=ON \
             -DOmega_h_USE_OpenMP=OFF \
             -DOmega_h_USE_Kokkos=ON \
             -DKokkos_PREFIX=$kk \
             -DCMAKE_INSTALL_PREFIX=$oh

make -j8 install

