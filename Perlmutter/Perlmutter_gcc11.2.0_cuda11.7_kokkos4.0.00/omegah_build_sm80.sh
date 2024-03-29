module load PrgEnv-gnu
module load cudatoolkit/11.7
module load craype-accel-nvidia80
module load cmake/3.22.0

export cuda=$CRAY_CUDATOOLKIT_DIR
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
cmake $ohsrc -DCMAKE_INSTALL_PREFIX=$oh -DBUILD_SHARED_LIBS=OFF \
             -DCMAKE_BUILD_TYPE=Release \
             -DOmega_h_USE_CUDA=on -DOmega_h_CUDA_ARCH=80 \
             -DOmega_h_USE_Kokkos=ON -DOmega_h_USE_MPI=ON \
             -DOmega_h_USE_OpenMP=OFF \
             -DBUILD_TESTING=OFF \
             -DCMAKE_CXX_COMPILER=CC \
             -DCMAKE_CXX_FLAGS='-std=c++14' \
             -DCMAKE_CUDA_FLAGS="-I$MPICH_DIR/include" \
             -DKokkos_PREFIX=$kk/lib64/cmake/

make -j8 install
