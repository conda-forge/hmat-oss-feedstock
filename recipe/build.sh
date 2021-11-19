#!/bin/sh

mkdir build && cd build

cmake ${CMAKE_ARGS} \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DBUILD_EXAMPLES=ON \
  -DCMAKE_INSTALL_RPATH="${PREFIX}/lib" -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DCMAKE_MACOSX_RPATH=ON \
  -DHMAT_GIT_VERSION=OFF \
  -DHMAT_DISABLE_OPENMP=OFF \
  -DCBLAS_INCLUDE_DIRS=${PREFIX}/include \
  ..

make install -j${CPU_COUNT}
if test "${BUILD}" == "${HOST}"
then
  ./c-simple-cylinder 1000 D
fi
