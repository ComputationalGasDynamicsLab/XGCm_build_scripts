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

# omega_h
export oh=$installroot/omega_h/install
export ohsrc=$srcroot/omega_h

cd $installroot
mkdir -p omega_h/build
cd omega_h/build
cmake $ohsrc -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=$oh \
             -DBUILD_SHARED_LIBS=OFF \
             -DOmega_h_USE_Kokkos=ON \
             -DOmega_h_USE_CUDA=on \
             -DOmega_h_CUDA_ARCH=86 \
             -DOmega_h_USE_MPI=on \
             -DOmega_h_USE_OpenMP=OFF \
             -DBUILD_TESTING=ON \
             -DCMAKE_CXX_COMPILER=mpicxx \
             -DCMAKE_C_COMPILER=mpicc \
             -DKokkos_PREFIX=$kk/lib64/cmake
make -j4 install
ctest
