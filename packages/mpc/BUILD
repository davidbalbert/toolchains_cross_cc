load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

configure_make(
    name = "bootstrap_libmpc",
    lib_source = "@mpc//:srcs",
    out_static_libs = [
        "libmpc.a",
    ],
    deps = ["//packages/gmp:bootstrap_libgmp", "//packages/mpfr:bootstrap_libmpfr"],
    visibility = ["//visibility:public"],
    env = {
        # Workaround for https://github.com/bazel-contrib/rules_foreign_cc/issues/1160
        "LD": "",
    },
)

filegroup(
    name = "bootstrap_install_prefix",
    srcs = [":bootstrap_libmpc"],
    output_group = "gen_dir",
    visibility = ["//visibility:public"],
)
