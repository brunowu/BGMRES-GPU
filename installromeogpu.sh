#!/bin/bash  

USE_CUDA=ON  # ON if GPU
USE_OPENMP=ON 

EXAMPLE=OFF
TEST=ON
COMPLEX=OFF # ON if use complex scalar

BUILD_TYPE=RELEASE  # or DEBUG
#TRILINOS_DIR=/home/xinzhewu/softwares/trilinos-final/Trilinos-source/Trilinos-trilinos-release-12-12-branch
TRILINOS_DIR=/home/xinzhewu/softwares/new-trilinos/Trilinos
INSTALL_DIR=/home/xinzhewu/softwares/trilinos-final/trilinos_gpu_openmpi2

rm -rf C*  
cmake \
	-D BUILD_SHARED_LIBS:BOOL=OFF \
	-D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
	-D Trilinos_ENABLE_INSTALL_CMAKE_CONFIG_FILES:BOOL=ON \
	-D Trilinos_ENABLE_EXAMPLES:BOOL=${EXAMPLE} \
	-D Trilinos_ENABLE_TESTS:BOOL=OFF \
	-D Trilinos_ENABLE_Kokkos=ON \
	-D Trilinos_ENABLE_KokkosCore:BOOL=ON \
	-D Trilinos_ENABLE_KokkosAlgorithms:BOOL=ON \
	-D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
	-D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=OFF \
	-D Trilinos_ENABLE_Tpetra:BOOL=ON \
	-D Teuchos_ENABLE_LONG_LONG_INT:BOOL=OFF \
	-D Trilinos_ENABLE_COMPLEX=${COMPLEX} \
	-D Trilinos_ENABLE_Epetra=ON \
	-D Trilinos_ENABLE_Tpetra=ON \
	-D Trilinos_ENABLE_Belos=ON \
	-D Trilinos_ENABLE_Anasazi=OFF \
	-D Trilinos_ENABLE_AztecOO=OFF\
	-D Trilinos_ENABLE_IFPACK=OFF \
  	-D Trilinos_ENABLE_ifpack2=OFF \
	-D Trilinos_ENABLE_Teko=OFF \
  	-D Trilinos_ENABLE_EpetraExt=OFF \
  	-D Trilinos_ENABLE_Teuchos=ON \
	-D Trilinos_ENABLE_TriUtils=ON \
	-D CMAKE_BUILD_TYPE:STRING=${BUILD_TYPE} \
	-D CMAKE_CXX_COMPILER:FILEPATH="mpicxx" \
	-D MPI_Fortran_COMPILER:FILEPATH="mpif90" \
	-D CMAKE_CXX_FLAGS="-arch=sm_60 --expt-extended-lambda" \
	-D CMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
	-D KOKKOS_ENABLE_CUDA_LAMBDA:BOOL=ON \
	-D BLAS_LIBRARY_DIRS="/home/xinzhewu/lib" \
	-D LAPACK_LIBRARY_DIRS="/home/xinzhewu/lib" \
	-D CMAKE_SKIP_RULE_DEPENDENCY=OFF \
	-D CMAKE_INSTALL_PREFIX:PATH=${INSTALL_DIR} \
	-D TPL_ENABLE_GLM=OFF \
	-D TPL_ENABLE_MPI:BOOL=ON \
	-D TPL_ENABLE_LAPACK:BOOL=ON \
	-D TPL_ENABLE_BLAS:BOOL=ON \
	-D TPL_ENABLE_Boost=OFF \
  	-D TPL_ENABLE_Netcdf=OFF \
	-D CMAKE_SKIP_RULE_DEPENDENCY=OFF \
	-D Trilinos_ENABLE_OpenMP=ON \
	-D Kokkos_ENABLE_OpenMP:BOOL=ON \
	-D Kokkos_ENABLE_TESTS:BOOL=ON \
	-D TPL_ENABLE_CUDA:BOOL=ON \
	-D TPL_ENABLE_CUSPARSE:BOOL=ON \
	-D Kokkos_ENABLE_Cuda:BOOL=ON \
	-D Kokkos_ENABLE_Cuda_UVM:BOOL=ON \
	$TRILINOS_DIR    

