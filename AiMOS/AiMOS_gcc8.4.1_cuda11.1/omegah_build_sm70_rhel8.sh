module use /gpfs/u/software/dcs-rhel8-spack-install/v0162gccSpectrum/lmod/linux-rhel8-ppc64le/Core/
module load spectrum-mpi/10.4-2ycgnlq
module load cmake/3.20.0/1
module load cuda/11.1-3vj4c72 \

export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export kk=$installroot/kokkos/install
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

export OMPI_CXX=$kksrc/bin/nvcc_wrapper
export OMPI_CC=gcc

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc  -DCMAKE_INSTALL_PREFIX=$oh -DBUILD_SHARED_LIBS=OFF \
              -DOmega_h_USE_Kokkos=ON -DOmega_h_CUDA_ARCH=70 \
              -DOmega_h_USE_CUDA=on -DOmega_h_USE_MPI=on \
              -DCMAKE_CXX_COMPILER=g++ \
              -DKokkos_PREFIX=$kk/lib64/cmake/

make -j4 install

