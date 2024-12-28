load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "rules_foreign_cc",
    sha256 = "8e5605dc2d16a4229cb8fbe398514b10528553ed4f5f7737b663fdd92f48e1c2",
    strip_prefix = "rules_foreign_cc-0.13.0",
    url = "https://github.com/bazel-contrib/rules_foreign_cc/releases/download/0.13.0/rules_foreign_cc-0.13.0.tar.gz",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()

# Why do I have to add this manually for rules_foreign_cc to work?
http_archive(
    name = "bazel_features",
    sha256 = "9c7f9a4c997cbf0eb93572b68b0ff0bb9822004633101a16d89499e814190323",
    strip_prefix = "bazel_features-1.22.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.22.0/bazel_features-v1.22.0.tar.gz",
)
load("@bazel_features//:deps.bzl", "bazel_features_deps")
bazel_features_deps()

http_archive(
    name = "binutils",
    build_file = "@//packages:BUILD.binutils",
    url = "https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz",
    sha256 = "820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c",
    strip_prefix = "binutils-2.37",
)

http_archive(
    name = "gmp",
    build_file = "@//packages:BUILD.gmp",
    url = "https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz",
    sha256 = "a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898",
    strip_prefix = "gmp-6.3.0",
)

http_archive(
    name = "mpfr",
    build_file = "@//packages:BUILD.mpfr",
    url = "https://www.mpfr.org/mpfr-current/mpfr-4.2.1.tar.xz",
    sha256 = "277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2",
    strip_prefix = "mpfr-4.2.1",
)

http_archive(
    name = "mpc",
    build_file = "@//packages:BUILD.mpc",
    url = "https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz",
    sha256 = "ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8",
    strip_prefix = "mpc-1.3.1",
)
