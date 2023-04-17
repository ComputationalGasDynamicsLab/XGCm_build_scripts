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
    '--COPTFLAGS=-g -O2 -fPIC',
    '--CXXOPTFLAGS=-g -O2 -fPIC',
    '--FOPTFLAGS=-g -O2 -fPIC',
    '--with-cuda=1',
    '--with-cuda-gencodearch=86',
    '--with-cudac=nvcc',
    '--with-parmetis-dir=' + os.environ['PARMETIS_ROOT'],
    '--with-metis-dir=' + os.environ['METIS_ROOT'],
    '--download-triangle',
    '--download-fblaslapack=1',
    '--with-mpi',
    '--with-make-np=4',
  ] 
  configure.petsc_configure(configure_options)
