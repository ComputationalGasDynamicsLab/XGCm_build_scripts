module use /opt/scorec/spack/dev/lmod/linux-rhel7-x86_64/Core
module load gcc/7.4.0-c5aaloy
module load cmake/3.20.0
module load mpich/3.3.1-bfezl2l

cuda=/usr/local/cuda-11.7
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc -DCMAKE_CXX_COMPILER=$kksrc/bin/nvcc_wrapper \
             -DBUILD_SHARED_LIBS=ON \
             -DKokkos_ARCH_PASCAL61=on \
             -DKokkos_ENABLE_SERIAL=ON \
             -DKokkos_ENABLE_OPENMP=off \
             -DKokkos_ENABLE_CUDA=on \
             -DKokkos_ENABLE_CUDA_LAMBDA=on \
             -DKokkos_ENABLE_DEBUG=on \
             -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install


