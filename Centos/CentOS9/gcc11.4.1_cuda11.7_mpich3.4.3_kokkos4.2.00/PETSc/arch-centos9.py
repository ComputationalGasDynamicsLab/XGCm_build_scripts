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
    '--with-debugging=yes',
    '--COPTFLAGS=-g -O2 -fPIC',
    '--CXXOPTFLAGS=-g -O2 -fPIC',
    '--FOPTFLAGS=-g -O2 -fPIC',
    '--with-cuda=1',
    '--with-cuda-gencodearch=61',
    '--with-cudac=nvcc',
    '--download-fblaslapack',
    '--download-metis',
    '--download-parmetis',
    '--download-HDF5',
    '--with-make-np=4',
    '--download-triangle',
  ] 
  configure.petsc_configure(configure_options)
  #  '--download-hypre',
