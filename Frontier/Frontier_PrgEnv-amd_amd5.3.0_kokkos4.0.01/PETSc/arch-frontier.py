#!/usr/bin/python3
if __name__ == '__main__':
  import os
  import sys
  sys.path.insert(0, os.path.abspath('config'))
  import configure
  configure_options = [
    '--with-hip=1',
    '--with-hipc=hipcc',
    '--with-clanguage=c',
    '--with-cc=cc',
    '--with-cxx=CC',
    '--with-fc=ftn',
    '--COPTFLAGS=-g -O3 -fPIC',
    '--CXXOPTFLAGS=-g -O3 -fPIC',
    '--FOPTFLAGS=-g -O3 -fPIC',
    '--with-fortran-bindings=0',
    '--with-shared-libraries=1',
    '--with-make-np=8',
    '--download-metis',
    '--download-parmetis',
    '--download-triangle',
    '--download-blas',
    '--download-lapack',
    '--HIPOPTFLAGS=-Ofast --offload-arch=gfx90a',
    '--with-debugging=no',
  ]
  configure.petsc_configure(configure_options)
