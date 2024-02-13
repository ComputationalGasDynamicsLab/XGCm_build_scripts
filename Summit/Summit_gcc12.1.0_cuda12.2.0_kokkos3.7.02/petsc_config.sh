module load gcc/12.1.0
module load cuda/12.2.0
module load cmake/3.27.7
module load valgrind/3.20.0
module load hdf5/1.14.3

# configure with cuda
#./configure --with-mpiexec="jsrun -g 1" --with-shared-libraries=1 --with-debugging=yes --COPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --CXXOPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --FOPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --with-cuda=1 --with-fortran-bindings=0 --with-batch=0 --with-cuda-arch=70 --with-cudac=nvcc --download-metis --download-parmetis --with-blaslapack-lib="-L/sw/summit/spack-envs/summit-plus/opt/gcc-12.1.0/netlib-lapack-3.11.0-g3vx4sojdbcj5ph6t4gzimzbtkfjpn4y/lib64 -lblas -llapack" --download-triangle --with-make-np=4 --with-mpi-dir="/sw/summit/spack-envs/summit-plus/opt/gcc-12.1.0/spectrum-mpi-10.4.0.6-20230210-db5xakaaqowbhp3nqwebpxrdbwtm4knu" PETSC_ARCH=arch-summit

# configure without cuda, download netlib-lapack
./configure --with-mpiexec="jsrun -g 1" --with-shared-libraries=1 --with-debugging=yes --COPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --CXXOPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --FOPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --with-cuda=0 --with-fortran-bindings=0 --with-batch=0 --with-cuda-arch=70 --with-cudac=nvcc --download-metis --download-parmetis --download-fblaslapack --download-triangle --with-make-np=4 --with-mpi-dir="/sw/summit/spack-envs/summit-plus/opt/gcc-12.1.0/spectrum-mpi-10.4.0.6-20230210-db5xakaaqowbhp3nqwebpxrdbwtm4knu" PETSC_ARCH=arch-summit

# configure with cuda, download netlib-lapack
#./configure --with-mpiexec="jsrun -g 1" --with-shared-libraries=1 --with-debugging=yes --COPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --CXXOPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --FOPTFLAGS="-g -Ofast -mcpu=power9 -fPIC" --with-cuda=1 --with-fortran-bindings=0 --with-batch=0 --with-cuda-arch=70 --with-cudac=nvcc --download-metis --download-parmetis --download-fblaslapack --download-triangle --with-make-np=4 --with-mpi-dir="/sw/summit/spack-envs/summit-plus/opt/gcc-12.1.0/spectrum-mpi-10.4.0.6-20230210-db5xakaaqowbhp3nqwebpxrdbwtm4knu" PETSC_ARCH=arch-summit
