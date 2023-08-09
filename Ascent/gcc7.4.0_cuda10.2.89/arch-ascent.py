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
    '--with-shared-libraries=1',
    '--with-debugging=no',
    '--COPTFLAGS=-g -Ofast -mcpu=power9 -fPIC',
    '--CXXOPTFLAGS=-g -Ofast -mcpu=power9 -fPIC',
    '--FOPTFLAGS=-g -Ofast -mcpu=power9 -fPIC',
    '--with-cuda',
    '--with-cuda-gencodearch=70',
    '--with-cudac=nvcc',
    '--with-parmetis-dir=' + os.environ['OLCF_PARMETIS_ROOT'],
    '--with-metis-dir=' + os.environ['OLCF_METIS_ROOT'],
    '--with-blaslapack-lib=-L' + os.environ['OLCF_NETLIB_LAPACK_ROOT'] + '/lib64 -lblas -llapack',
    '--with-make-np=4',
  ]
  configure.petsc_configure(configure_options)
