load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

configure_make(
    name = "bootstrap_gcc",
    lib_source = "@gcc//:srcs",
    configure_options = [
        # adapted from https://www.linuxfromscratch.org/lfs/view/stable/chapter05/gcc-pass1.html
        "--target=aarch64-unknown-linux-gnu",
        "--with-sysroot=aarch64-unknown-linux-gnu/sysroot",
        "--with-glibc-version=2.36",
        "--enable-languages=c,c++",

        "--with-newlib",
        "--without-headers",
        "--enable-default-pie",
        "--enable-default-ssp",
        "--disable-nls",
        "--disable-shared",
        "--disable-multilib",
        "--disable-threads",
        "--disable-libatomic",
        "--disable-libgomp",
        "--disable-libquadmath",
        "--disable-libssp",
        "--disable-libvtv",
        "--disable-libstdcxx",

        # only needed because host == target (not a cross compiler), but we want to build it like a cross compiler.
        "--disable-bootstrap",

        "--with-gmp=$(execpath //packages/gmp:bootstrap_install_prefix)",
        "--with-mpfr=$(execpath //packages/mpfr:bootstrap_install_prefix)",
        "--with-mpc=$(execpath //packages/mpc:bootstrap_install_prefix)",

        # TODO: reproducible builds. Search for BR2_REPRODUCIBLE in buildroot. --with-debug-prefix-map=$(BASE_DIR)=buildroot
    ],
    out_binaries = [
        "aarch64-unknown-linux-gnu-gcc",
        "aarch64-unknown-linux-gnu-g++",
    ],
    deps = [
        "//packages/binutils:bootstrap_binutils",
        "//packages/gmp:bootstrap_libgmp",
        "//packages/mpfr:bootstrap_libmpfr",
        "//packages/mpc:bootstrap_libmpc",
    ],
    data = [
        # these are really build_data, but that causes each package to be compiled twice,
        # once normally, and once "[for tool]" (exec configuration). Not sure if we can
        # fix that.
        "//packages/gmp:bootstrap_install_prefix",
        "//packages/mpfr:bootstrap_install_prefix",
        "//packages/mpc:bootstrap_install_prefix",
    ],
    visibility = ["//visibility:public"],
    env = {
        # Workaround for https://github.com/bazel-contrib/rules_foreign_cc/issues/1160
        "LD": "",
    },
)
