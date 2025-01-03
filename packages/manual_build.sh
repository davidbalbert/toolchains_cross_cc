TARGET="aarch64-unknown-linux-gnu"
STAGE1_PREFIX="/tmp/gccbuild/out-stage1"
STAGE2_PREFIX="/tmp/gccbuild/out-stage2"
STAGE2_SYSROOT="$STAGE2_PREFIX/$TARGET/sysroot"
PREFIX="/tmp/gccbuild/out"
SYSROOT="$PREFIX/$TARGET/sysroot"

mkdir build-binutils
cd build-binutils
../binutils-2.37/configure --prefix="$STAGE1_PREFIX" --with-sysroot="$STAGE2_SYSROOT" --target="$TARGET" --program-prefix="$TARGET-" --enable-new-dtags
make -j10
make install
cd ..

mkdir build-gmp
cd build-gmp
../gmp-6.3.0/configure --prefix="$STAGE1_PREFIX"
make -j10
make install
cd ..

mkdir build-mpfr
cd build-mpfr
../mpfr-4.2.1/configure --prefix="$STAGE1_PREFIX" --with-gmp="$STAGE1_PREFIX"
make -j10
make install
cd ..

mkdir build-mpc
cd build-mpc
../mpc-1.3.1/configure --prefix="$STAGE1_PREFIX" --with-gmp="$STAGE1_PREFIX"
make -j10
make install
cd ..

mkdir build-gcc
cd build-gcc
../gcc-14.2.0/configure \
    --prefix="$STAGE1_PREFIX" \
    --with-sysroot="$STAGE2_SYSROOT" \
    --target="$TARGET" \
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
    --with-gmp="$STAGE1_PREFIX" \
    --enable-languages=c,c++
make -j10
make install
cd ..

cd linux-6.12.8
make ARCH=arm64 INSTALL_HDR_PATH="$STAGE2_SYSROOT/usr" headers_install
cd ..

mkdir build-glibc
cd build-glibc
../glibc-2.40/configure \
    --prefix="$STAGE2_SYSROOT/usr" \
    --host="$TARGET" \
    --with-headers="$STAGE2_SYSROOT/usr/include" \
    --enable-kernel=4.19 \
    --disable-multilib \
    CC="$STAGE1_PREFIX/bin/aarch64-unknown-linux-gnu-gcc" \
    CXX="$STAGE1_PREFIX/bin/aarch64-unknown-linux-gnu-g++"
make -j10
make install
cd ..

mkdir build-libstdc++
cd build-libstdc++
../gcc-14.2.0/libstdc++-v3/configure \
    --host="$TARGET" \
    --prefix="$STAGE2_SYSROOT/usr" \
    --disable-multilib \
    --disable-nls \
    --with-gxx-include-dir="$STAGE1_PREFIX/$TARGET/include/c++/14.2.0" \
    CFLAGS="--sysroot='$STAGE2_SYSROOT'" \
    CC="$STAGE1_PREFIX/bin/aarch64-unknown-linux-gnu-gcc" \
    CXX="$STAGE1_PREFIX/bin/aarch64-unknown-linux-gnu-g++" \
    AS="$STAGE1_PREFIX/aarch64-unknown-linux-gnu/bin/as" \
    AR="$STAGE1_PREFIX/aarch64-unknown-linux-gnu/bin/ar" \
    NM="$STAGE1_PREFIX/aarch64-unknown-linux-gnu/bin/nm" \
    OBJDUMP="$STAGE1_PREFIX/aarch64-unknown-linux-gnu/bin/objdump" \
    STRIP="$STAGE1_PREFIX/aarch64-unknown-linux-gnu/bin/strip" \
    RANLIB="$STAGE1_PREFIX/aarch64-unknown-linux-gnu/bin/ranlib"
make -j10
make install
cd ..
