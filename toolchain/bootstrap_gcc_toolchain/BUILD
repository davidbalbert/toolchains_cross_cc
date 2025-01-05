load("@rules_cc//cc/toolchains:toolchain.bzl", "cc_toolchain")
load("@rules_cc//cc/toolchains:tool_map.bzl", "cc_tool_map")
load("@rules_cc//cc/toolchains:tool.bzl", "cc_tool")

cc_tool(
    name = "gcc",
    src = "//packages/gcc/bootstrap_bin:aarch64-unknown-linux-gnu-gcc",
)

cc_tool(
    name = "g++",
    src = "//packages/gcc/bootstrap_bin:aarch64-unknown-linux-gnu-g++",
)

cc_tool(
    name = "as",
    src = "//packages/binutils/bootstrap_bin:aarch64-unknown-linux-gnu-as",
)

cc_tool(
    name = "ld",
    src = "//packages/binutils/bootstrap_bin:aarch64-unknown-linux-gnu-ld",
)

cc_tool(
    name = "ar",
    src = "//packages/binutils/bootstrap_bin:aarch64-unknown-linux-gnu-ar",
)

cc_tool(
    name = "objcopy",
    src = "//packages/binutils/bootstrap_bin:aarch64-unknown-linux-gnu-objcopy",
)

cc_tool(
    name = "strip",
    src = "//packages/binutils/bootstrap_bin:aarch64-unknown-linux-gnu-strip",
)

cc_tool_map(
    name = "tool_map",
    tools = {
        "@rules_cc//cc/toolchains/actions:c_compile": ":gcc",
        "@rules_cc//cc/toolchains/actions:cpp_compile_actions": ":g++",
        "@rules_cc//cc/toolchains/actions:assembly_actions": ":as",
        "@rules_cc//cc/toolchains/actions:link_actions": ":ld",
        "@rules_cc//cc/toolchains/actions:ar_actions": ":ar",
        "@rules_cc//cc/toolchains/actions:objcopy_embed_data": ":objcopy",
        "@rules_cc//cc/toolchains/actions:strip": ":strip",
    },
)

cc_toolchain(
    name = "toolchain",
    tool_map = ":tool_map",
)

toolchain(
    name = "bootstrap_gcc_toolchain",
    toolchain = ":toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
