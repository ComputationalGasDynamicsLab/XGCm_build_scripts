module use /opt/scorec/spack/dev/lmod/linux-rhel7-x86_64/Core
module load gcc/7.4.0-c5aaloy
module load cmake
module load mpich/3.3.1-bfezl2l

cuda=/usr/local/cuda-11.7
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../

# EnGPar
export EnGParsrc=$srcroot/EnGPar/
export EnGPar=$installroot/EnGPar/install

cd $installroot
mkdir -p EnGPar/build
cd EnGPar/build
cmake $EnGParsrc -DCMAKE_INSTALL_PREFIX=$EnGPar \
                 -DBUILD_SHARED_LIBS=ON \
                 -DCMAKE_C_COMPILER=mpicc \
                 -DCMAKE_CXX_COMPILER=mpicxx \
                 -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PARMETIS=OFF \
                 -DENABLE_PUMI=OFF \
                 -DIS_TESTING=OFF

make -j4 install

