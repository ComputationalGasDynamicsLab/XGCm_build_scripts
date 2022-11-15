module load PrgEnv-gnu
module load cudatoolkit/11.5
module load cmake/3.22.0
module list

export cuda=$CRAY_CUDATOOLKIT_DIR
export PATH=$cuda/bin:$PATH
export LD_LIBRARY_PATH=$cuda/lib64:$LD_LIBRARY_PATH
export installroot=$PWD
export srcroot=$installroot/../                                                                                              

# AmgX
export amgxsrc=$srcroot/amgx
export amgx=$installroot/amgx/install

cd $installroot
mkdir -p amgx/build
cd amgx/build

cmake $amgxsrc -DCMAKE_BUILD_TYPE=Release \
               -DBUILD_SHARED_LIBS=ON -DCUDA_ARCH=80 \
               -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ \
               -DCMAKE_INSTALL_PREFIX=$amgx

make VERBOSE=1 -j8 install
