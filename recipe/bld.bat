
mkdir build && cd build
cmake -LAH -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DHMAT_GIT_VERSION=OFF ^
    -DHMAT_DISABLE_OPENMP=OFF ^
    -DBUILD_EXAMPLES=ON ^
    ..
if errorlevel 1 exit 1

cmake --build . --target install --parallel %CPU_COUNT%
if errorlevel 1 exit 1

ctest --output-on-failure -j%CPU_COUNT%
if errorlevel 1 exit 1
