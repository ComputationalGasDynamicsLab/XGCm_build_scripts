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
                 -DCMAKE_C_COMPILER=mpicc \
                 -DBUILD_SHARED_LIBS=ON \
                 -DCMAKE_CXX_COMPILER=mpicxx \
                 -DCMAKE_CXX_FLAGS="-std=c++11" \
                 -DENABLE_PARMETIS=OFF \
                 -DENABLE_PUMI=OFF \
                 -DIS_TESTING=OFF

make -j4 install

