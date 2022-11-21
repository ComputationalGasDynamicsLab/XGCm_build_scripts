module use /opt/scorec/spack/dev/lmod/linux-rhel7-x86_64/Core
module load gcc/7.4.0-c5aaloy
module load cmake/3.20.0
module load mpich/3.3.1-bfezl2l
module load valgrind/3.15.0-4464rs2
module load hdf5/1.10.5-ftn-tb7hfxx
module load netlib-scalapack/2.0.2-yjmafdq
module load hypre/2.18.1-int32-y2p4vsy

./configure --with-shared-libraries=1 --with-debugging=0 --with-cuda=1 \
            --with-cc=mpicc --with-cxx=mpicxx --with-fc=mpif90 \
            --with-shared-libraries=1 --with-debugging=0 \
            --COPTFLAGS="-g -O2 -fPIC" --CXXOPTFLAGS="-g -O2 -fPIC" \
            --FOPTFLAGS="-g -O2 -fPIC" \
            --download-parmetis --download-metis \
            --download-triangle --with-make-np=4
