BOOTSTRAP_PREFIX="/tmp/gccbuild/out-bootstrap"
PREFIX="/tmp/gccbuild/out"
TARGET="aarch64-unknown-linux-gnu"
SYSROOT="$PREFIX/$TARGET/sysroot"

mkdir build-binutils
cd build-binutils
../binutils-2.37/configure --prefix=$BOOTSTRAP_PREFIX --with-sysroot=$SYSROOT --target=$TARGET --enable-new-dtags
make -j10
make install
cd ..

mkdir build-gmp
cd build-gmp
../gmp-6.3.0/configure --prefix=$BOOTSTRAP_PREFIX
make -j10
make install
cd ..

mkdir build-mpfr
cd build-mpfr
../mpfr-4.2.1/configure --prefix=$BOOTSTRAP_PREFIX --with-gmp=$BOOTSTRAP_PREFIX
make -j10
make install
cd ..

mkdir build-mpc
cd build-mpc
../mpc-1.3.1/configure --prefix=$BOOTSTRAP_PREFIX --with-gmp=$BOOTSTRAP_PREFIX
make -j10
make install
cd ..

mkdir build-gcc
cd build-gcc
../gcc-14.2.0/configure \
    --prefix=$BOOTSTRAP_PREFIX \
    --with-sysroot=$SYSROOT \
    --target=$TARGET \
    --with-glibc-version=2.40 \
    --with-newlib \
    --without-headers \
    --enable-default-pie \
    --enable-default-ssp \
    --disable-nls \
    --disable-shared \
    --disable-multilib \
    --disable-threads \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-libstdcxx \
    --disable-bootstrap \
    --with-gmp=$BOOTSTRAP_PREFIX \
    --enable-languages=c,c++
make -j10
make install
cd ..

cd linux-6.12.8
make ARCH=arm64 INSTALL_HDR_PATH=$SYSROOT headers_install
cd ..

mkdir build-glibc
cd build-glibc
../glibc-2.40/configure \
    --prefix=$SYSROOT \
    --host=$TARGET \
    --with-headers=$SYSROOT/include \
    --enable-kernel=4.19 \
    --disable-multilib \
    CC="$BOOTSTRAP_PREFIX/bin/aarch64-unknown-linux-gnu-gcc" \
    CXX="$BOOTSTRAP_PREFIX/bin/aarch64-unknown-linux-gnu-g++"
make -j10
make install
cd ..
