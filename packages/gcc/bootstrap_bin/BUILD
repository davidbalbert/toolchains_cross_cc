load("@rules_foreign_cc//foreign_cc:defs.bzl", "runnable_binary")

runnable_binary(
    name = "aarch64-unknown-linux-gnu-gcc",
    binary = "aarch64-unknown-linux-gnu-gcc",
    foreign_cc_target = "//packages/gcc:bootstrap_gcc",
    visibility = ["//visibility:public"],
)

runnable_binary(
    name = "aarch64-unknown-linux-gnu-g++",
    binary = "aarch64-unknown-linux-gnu-g++",
    foreign_cc_target = "//packages/gcc:bootstrap_gcc",
    visibility = ["//visibility:public"],
)
