load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

configure_make(
    name = "bootstrap_libgmp",
    lib_source = "@gmp//:srcs",
    out_static_libs = [
        "libgmp.a",
    ],
    visibility = ["//visibility:public"],
    env = {
        # Workaround for https://github.com/bazel-contrib/rules_foreign_cc/issues/1160
        "LD": "",
    },
)

filegroup(
    name = "bootstrap_install_prefix",
    srcs = [":bootstrap_libgmp"],
    output_group = "gen_dir",
    visibility = ["//visibility:public"],
)
