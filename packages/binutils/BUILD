load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

BINS = [
    "aarch64-unknown-linux-gnu-addr2line",
    "aarch64-unknown-linux-gnu-ar",
    "aarch64-unknown-linux-gnu-as",
    "aarch64-unknown-linux-gnu-c++filt",
    "aarch64-unknown-linux-gnu-elfedit",
    "aarch64-unknown-linux-gnu-gprof",
    "aarch64-unknown-linux-gnu-ld",
    "aarch64-unknown-linux-gnu-ld.bfd",
    "aarch64-unknown-linux-gnu-nm",
    "aarch64-unknown-linux-gnu-objcopy",
    "aarch64-unknown-linux-gnu-objdump",
    "aarch64-unknown-linux-gnu-ranlib",
    "aarch64-unknown-linux-gnu-readelf",
    "aarch64-unknown-linux-gnu-size",
    "aarch64-unknown-linux-gnu-strings",
    "aarch64-unknown-linux-gnu-strip",
]

LIBS = [
    "libbfd.a",
    "libopcodes.a",
    "libctf.a",
    "libctf-nobfd.a",
]

SHARED_LIBS = [
    "bfd-plugins/libdep.so",
]

# LIBTOOLS = ["lib/" + lib.replace(".a", ".la") for lib in LIBS]

configure_make(
    name = "bootstrap_binutils",
    lib_source = "@binutils//:srcs",
    configure_options = [
        # adapted from https://www.linuxfromscratch.org/lfs/view/stable/chapter05/binutils-pass1.html
        "--target=aarch64-unknown-linux-gnu",
        "--with-sysroot=aarch64-unknown-linux-gnu/sysroot",
        "--program-prefix=aarch64-unknown-linux-gnu-",
        "--disable-nls",
        "--enable-new-dtags",
    ],
    out_binaries = BINS,
    out_static_libs = LIBS,
    # out_shared_libs = SHARED_LIBS,
    # out_data_dirs = LIBTOOLS + ["share", "aarch64-unknown-linux-gnu"],
    visibility = ["//visibility:public"],
    env = {
        # Workaround for https://github.com/bazel-contrib/rules_foreign_cc/issues/1160
        "LD": "",
    },
)
