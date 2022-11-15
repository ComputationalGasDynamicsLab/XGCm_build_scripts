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


cd $installroot
mkdir -p kokkos/build
cd kokkos/build
cmake $kksrc -DCMAKE_CXX_COMPILER=$kksrc/bin/nvcc_wrapper \
             -DCMAKE_CXX_FLAGS= -DKokkos_ARCH_VOLTA70=ON \
             -DKokkos_ENABLE_SERIAL=ON -DKokkos_ENABLE_OPENMP=off \
             -DKokkos_ENABLE_CUDA=on -DKokkos_ENABLE_CUDA_LAMBDA=on \
             -DKokkos_ENABLE_DEBUG=off \
             -DCMAKE_INSTALL_PREFIX=$kk
make -j4 install


