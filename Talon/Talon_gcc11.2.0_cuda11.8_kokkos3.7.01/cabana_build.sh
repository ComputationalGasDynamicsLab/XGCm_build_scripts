module load cuda11.8/toolkit/11.8.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2
module list

export installroot=$PWD
export srcroot=$installroot/../

# kokkos
export kk=$installroot/kokkos/install
export kksrc=$srcroot/kokkos

# cabana
export cabanasrc=$srcroot/Cabana/
export cabana=$installroot/cabana/install

export CMAKE_PREFIX_PATH=$kk:$CMAKE_PREFIX_PATH


cd $installroot
mkdir -p cabana/build
cd cabana/build
cmake $cabanasrc -DCMAKE_BUILD_TYPE=Release \
                 -DCMAKE_CXX_COMPILER=mpicxx \
                 -DCMAKE_INSTALL_PREFIX=$cabana

make -j8 install

