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
    build_file = "@//gcc:BUILD.binutils",
    sha256 = "820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c",
    strip_prefix = "binutils-2.37",
    url = "https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz",
)
