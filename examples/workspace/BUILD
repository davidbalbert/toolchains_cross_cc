load("@toolchains_cross_cc//:toolchain.bzl", "cross_cc_toolchain")

cross_cc_toolchain(
    name = "aarch64_linux_gnu_gcc",
    compiler = "gcc",
    target = "aarch64-linux-gnu",
    libc = "glibc",
)

cc_binary(
    name = "hello",
    srcs = ["main.c"],
)
