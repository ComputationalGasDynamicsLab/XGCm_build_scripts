module load PrgEnv-gnu
module load cudatoolkit/11.7
module load craype-accel-nvidia80
module load cmake/3.22.0
module load cray-hdf5/1.12.1.5
module load cray-netcdf/4.8.1.5
#module load cray-hdf5-parallel/1.12.1.5
#module load cray-netcdf-hdf5parallel/4.8.1.5
module unload darshan
module list

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
export pumipic=$installroot/pumi-pic/install

# gitrm
export gitrmsrc=$srcroot/gitrm
export gitrm=$installroot/gitrm/install
export gitrmtestdir=$gitrmsrc/gitrm-data

export CMAKE_PREFIX_PATH=$kk:$oh:$EnGPar:$cabana:$pumipic:$netcdf:$CMAKE_PREFIX_PATH


cd $installroot
mkdir -p gitrm/build
cd gitrm/build

# below is just a simple way to handle a strange issue, when rebuilding,
# g++: error: unrecognized command-line option '-rpath'
rm CMakeCache.txt
cmake $gitrmsrc -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=CC \
               -DCMAKE_INSTALL_PREFIX=$gitrm \
               -DCMAKE_CXX_FLAGS="-g"

make -j8 install
