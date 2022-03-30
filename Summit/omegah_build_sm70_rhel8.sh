module load gcc/7.5.0
module load cuda/10.2.89
module load cmake/3.20.2

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
             -DOmega_h_USE_CUDA=on -DOmega_h_CUDA_ARCH=70 \
             -DOmega_h_USE_Kokkos=ON -DOmega_h_USE_MPI=on \
             -DCMAKE_CXX_COMPILER=mpiCC \
             -DBUILD_TESTING=OFF \
             -DCMAKE_CXX_FLAGS="-fPIC" \
             -DKokkos_PREFIX=$kk/lib64/cmake/

make -j16 install
