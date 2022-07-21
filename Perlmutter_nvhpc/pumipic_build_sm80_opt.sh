module load PrgEnv-nvidia
module load cudatoolkit/11.5
module load craype-accel-nvidia80
module load cmake/3.22.0
module unload darshan

export cuda=$CRAY_CUDATOOLKIT_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# omega_h
export oh=$installroot/omega_h/install
# particle structure
export ps=$installroot/particle_structures/install

#EnGPar
export EnGPar=$installroot/EnGPar/install

# cabana
export cabana=$installroot/cabana/install

# pumi-pic
export pumipicsrc=$srcroot/pumi-pic
export testdir=$pumipicsrc/pumipic-data
export pumipic=$installroot/pumi-pic/install

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$CMAKE_PREFIX_PATH
export OMPI_CXX=$kksrc/bin/nvcc_wrapper

cd $installroot
mkdir -p pumi-pic/build
cd pumi-pic/build
cmake $pumipicsrc -DCMAKE_BUILD_TYPE=Release \
                  -DCMAKE_CXX_COMPILER=CC \
                  -DENABLE_CABANA=ON \
                  -DIS_TESTING=OFF \
                  -DCMAKE_INSTALL_PREFIX=$pumipic \
                  -DTEST_DATA_DIR=$testdir


make -j8 install
