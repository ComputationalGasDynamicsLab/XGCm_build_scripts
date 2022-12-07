module load gcc/11.2.0
module load cuda/11.5.2
module load cmake/3.23.2

export cuda=$CUDA_DIR
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

cmake $amgxsrc -DCMAKE_BUILD_TYPE=Debug \
               -DBUILD_SHARED_LIBS=ON -DCUDA_ARCH=70 \
               -DCMAKE_CXX_COMPILER=mpiCC \
               -DCMAKE_C_COMPILER=mpicc \
               -DCMAKE_INSTALL_PREFIX=$amgx

make -j8 install
