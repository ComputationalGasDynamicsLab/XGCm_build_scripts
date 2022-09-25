#!/usr/bin/python3
if __name__ == '__main__':
  import os
  import sys
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-cc=mpicc',
    '--with-cxx=mpicxx',
    '--with-fc=mpif90',
    '--with-mpiexec=jsrun -g 1',
    '--with-shared-libraries=1',
    '--with-debugging=yes',
    '--COPTFLAGS=-g -fast -fPIC',
    '--CXXOPTFLAGS=-g -fast -fPIC',
    '--FOPTFLAGS=-g -fast -fPIC',
    '--with-cuda=1',
    '--with-cuda-gencodearch=70',
    '--with-cudac=nvcc',
    '--download-metis',
    '--download-parmetis',
    '--with-blaslapack-lib=-L' + os.environ['OLCF_NETLIB_LAPACK_ROOT'] + '/lib64 -lblas -llapack',
    '--download-triangle',
    '--with-make-np=4',
  ]
  configure.petsc_configure(configure_options)
