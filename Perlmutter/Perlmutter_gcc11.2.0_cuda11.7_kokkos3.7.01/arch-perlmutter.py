#!/usr/bin/python3
if __name__ == '__main__':
  import os
  import sys
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-cc=cc',
    '--with-cxx=CC',
    '--with-fc=ftn',
    '--with-shared-libraries=1',
    '--with-debugging=no',
    '--COPTFLAGS=-g -Ofast -fPIC',
    '--CXXOPTFLAGS=-g -Ofast -fPIC',
    '--FOPTFLAGS=-g -Ofast -fPIC',
    '--with-cuda',
    '--with-cuda-gencodearch=80',
    '--with-cudac=nvcc',
    '--download-metis',
    '--download-parmetis',
    '--download-openblas'
    '--with-make-np=8',
  ]
  configure.petsc_configure(configure_options)
