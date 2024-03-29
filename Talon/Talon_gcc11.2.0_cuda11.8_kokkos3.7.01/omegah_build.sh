module load cuda11.8/toolkit/11.8.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2

export installroot=$PWD
export srcroot=$installroot/../

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# omega_h
export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

export MPICH_CXX=$kksrc/bin/nvcc_wrapper

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc -DCMAKE_INSTALL_PREFIX=$oh \
	     -DBUILD_SHARED_LIBS=OFF \
             -DCMAKE_BUILD_TYPE=Release \
             -DOmega_h_USE_CUDA=ON \
	     -DOmega_h_CUDA_ARCH=70 \
             -DOmega_h_USE_Kokkos=ON \
	     -DOmega_h_USE_MPI=ON \
             -DOmega_h_USE_OpenMP=OFF \
             -DBUILD_TESTING=OFF \
             -DCMAKE_C_COMPILER=mpicc \
             -DCMAKE_CXX_COMPILER=mpicxx \
             -DKokkos_PREFIX=$kk/lib64/cmake/

make -j8 install
