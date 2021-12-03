module load PrgEnv-gnu
module load cpe-cuda
module load cmake/3.20.5
module load cuda/11.3.1

export cuda=$CUDA_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

export OMPI_CXX=$kksrc/bin/nvcc_wrapper

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc -DCMAKE_BUILD_TYPE=Debug \
             -DCMAKE_INSTALL_PREFIX=$oh -DBUILD_SHARED_LIBS=OFF \
             -DOmega_h_USE_CUDA=on -DOmega_h_CUDA_ARCH=80 \
             -DOmega_h_USE_Kokkos=ON -DOmega_h_USE_MPI=ON \
             -DCMAKE_CXX_COMPILER=CC \
             -DCMAKE_CUDA_FLAGS="-I$MPICH_DIR/include" \
             -DKokkos_PREFIX=$kk/lib64/cmake/

make -j8 install
#ctest
#             -DBUILD_TESTING=ON \
