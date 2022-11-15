#!/usr/bin/python3
if __name__ == '__main__':
  import os
  import sys
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-cc=mpicc',
    '--with-cxx=mpiCC',
    '--with-fc=mpif90',
    '--with-shared-libraries=1',
    '--with-debugging=no',
    '--COPTFLAGS=-g -O2 -mcpu=power9 -fPIC',
    '--CXXOPTFLAGS=-g -O2 -mcpu=power9 -fPIC',
    '--FOPTFLAGS=-g -O2 -mcpu=power9 -fPIC',
    '--with-cuda=1',
    '--with-cuda-gencodearch=70',
    '--with-cudac=nvcc',
    '--with-parmetis-dir=' + os.environ['PARMETIS_ROOT'],
    '--with-metis-dir=' + os.environ['METIS_ROOT'],
    '--with-make-np=16',
  ] 
  configure.petsc_configure(configure_options)
