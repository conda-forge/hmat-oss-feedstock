#!/bin/sh

mkdir build && cd build

ls -l ${PREFIX}/lib/libopenblas${SHLIB_EXT}* || find ${PREFIX} -name libopenblas${SHLIB_EXT}

cmake \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DINSTALL_INCLUDE_DIR=${PREFIX}/include/hmat \
  -DINSTALL_LIB_DIR=${PREFIX}/lib \
  -DBLAS_LIBRARIES=${PREFIX}/lib/libopenblas${SHLIB_EXT} \
  -DBLAS_LIBRARY_DIRS=${PREFIX}/lib \
  -DBUILD_EXAMPLES=ON \
  -DCMAKE_INSTALL_RPATH="${PREFIX}/lib" -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DCMAKE_MACOSX_RPATH=ON \
  -DCMAKE_CXX_FLAGS="-std=c++11" \
  -DHMAT_GIT_VERSION=OFF \
  -DHMAT_DISABLE_OPENMP=OFF \
  ..

make install -j${CPU_COUNT} VERBOSE=1
./c-simple-cylinder 1000 D
