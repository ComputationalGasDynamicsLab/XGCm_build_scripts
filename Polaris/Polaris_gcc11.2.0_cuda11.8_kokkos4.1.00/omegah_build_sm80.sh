module load PrgEnv-gnu/8.3.3
module load cudatoolkit-standalone/11.8.0
module load cmake/3.23.2

export installroot=$PWD
export srcroot=$installroot/../

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# omega_h
export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc -DCMAKE_INSTALL_PREFIX=$oh -DBUILD_SHARED_LIBS=OFF \
             -DCMAKE_BUILD_TYPE=Release \
             -DOmega_h_USE_CUDA=ON -DOmega_h_CUDA_ARCH=80 \
             -DOmega_h_USE_Kokkos=ON -DOmega_h_USE_MPI=ON \
             -DOmega_h_USE_OpenMP=OFF \
             -DBUILD_TESTING=OFF \
             -DCMAKE_CXX_COMPILER=CC \
             -DCMAKE_CXX_FLAGS='-std=c++14' \
             -DCMAKE_CUDA_FLAGS="-I$MPICH_DIR/include" \
             -DKokkos_PREFIX=$kk/lib64/cmake/

make -j8 install
