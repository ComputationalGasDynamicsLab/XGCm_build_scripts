module unuse /opt/scorec/spack/lmod/linux-rhel7-x86_64/Core 
module use /opt/scorec/spack/v0181_1/lmod/linux-rhel7-x86_64/Core 
module load gcc/11.2.0
module load mpich/4.0.2
module load cmake

cuda=/usr/local/cuda-11.4
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
             -DKokkos_ARCH_AMPERE86=on \
             -DKokkos_ENABLE_SERIAL=ON \
             -DKokkos_ENABLE_OPENMP=OFF \
             -DKokkos_ENABLE_CUDA=on \
             -DKokkos_ENABLE_CUDA_LAMBDA=on \
             -DKokkos_ENABLE_DEBUG=on \
             -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install


