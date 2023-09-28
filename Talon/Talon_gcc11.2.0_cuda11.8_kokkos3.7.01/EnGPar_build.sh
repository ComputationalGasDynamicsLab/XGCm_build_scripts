module load cuda11.8/toolkit/11.8.0
module load cmake/3.21.3
module load mpich/ge/gcc/64/3.3.2

export installroot=$PWD
export srcroot=$installroot/../
export kksrc=$srcroot/kokkos

export EnGParsrc=$srcroot/EnGPar/
export EnGPar=$installroot/EnGPar/install

cd $installroot
mkdir -p EnGPar/build
cd EnGPar/build
cmake $EnGParsrc -DCMAKE_INSTALL_PREFIX=$EnGPar \
                 -DCMAKE_BUILD_TYPE=Release \
	         -DCMAKE_C_COMPILER=mpicc \
                 -DCMAKE_CXX_COMPILER=mpicxx \
		 -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PARMETIS=OFF \
		 -DENABLE_PUMI=OFF \
		 -DIS_TESTING=OFF

make install -j4

