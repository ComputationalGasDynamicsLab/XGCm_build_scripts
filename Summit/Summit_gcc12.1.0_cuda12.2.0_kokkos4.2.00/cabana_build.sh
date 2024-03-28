module load gcc/12.1.0
module load cuda/12.2.0
module load cmake/3.27.7

export cuda=$CUDA_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# omega_h
export oh=$installroot/omega_h/install

#EnGPar
export EnGPar=$installroot/EnGPar/install

# cabana
export cabanasrc=$srcroot/Cabana
export cabana=$installroot/cabana/install

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$CMAKE_PREFIX_PATH
export OMPI_CXX=$kksrc/bin/nvcc_wrapper

cd $installroot
mkdir -p cabana/build
cd cabana/build

cmake $cabanasrc  -DCMAKE_BUILD_TYPE=Release \
                  -DCMAKE_CXX_COMPILER=mpicxx \
                  -DCMAKE_INSTALL_PREFIX=$cabana

make -j4 install

