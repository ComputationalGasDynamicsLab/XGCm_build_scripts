#!/usr/bin/python3
if __name__ == '__main__':
  import os
  import sys
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-cc=mpicc',
    '--with-cxx=mpicxx',
    '--with-fc=mpifort',
    '--with-shared-libraries=1',
    '--with-debugging=no',
    '--COPTFLAGS=-g -Ofast -fPIC',
    '--CXXOPTFLAGS=-g -Ofast -fPIC',
    '--FOPTFLAGS=-g -Ofast -fPIC',
    '--with-cuda',
    '--with-cuda-gencodearch=70',
    '--with-cudac=nvcc',
    '--download-metis',
    '--download-parmetis',
    '--download-fblaslapack=1',
    '--with-make-np=8',
  ]
  configure.petsc_configure(configure_options)
