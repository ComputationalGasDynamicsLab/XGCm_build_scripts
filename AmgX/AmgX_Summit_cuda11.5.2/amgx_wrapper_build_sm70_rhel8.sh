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

#AmgXWrapper
export amgx_wrapper_src=$srcroot/AmgXWrapper
export amgx_wrapper=$installroot/amgx_wrapper/install

export PETSC_DIR=$srcroot/petsc
export PETSC_ARCH=arch-summit
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig
export CMAKE_PREFIX_PATH=$amgx:$CMAKE_PREFIX_PATH

cd $installroot
mkdir -p amgx_wrapper/build
cd amgx_wrapper/build

cmake $amgx_wrapper_src -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=mpicxx \
                        -DBUILD_SHARED_LIBS=OFF -DCUDA_DIR=$cuda \
                        -DPETSC_EXECUTABLE_RUNS=ON \
                        -DCMAKE_INSTALL_PREFIX=$amgx_wrapper

make -j4 install
