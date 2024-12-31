load("@rules_cc//cc/toolchains:toolchain.bzl", "cc_toolchain")
load("@rules_cc//cc/toolchains:tool_map.bzl", "cc_tool_map")
load("@rules_cc//cc/toolchains:tool.bzl", "cc_tool")

cc_tool(
    name = "gcc",
    src = "@host_root//:usr/bin/gcc",
)

cc_tool(
    name = "g++",
    src = "@host_root//:usr/bin/g++",
)

cc_tool(
    name = "as",
    src = "@host_root//:usr/bin/as",
)

cc_tool(
    name = "ld",
    src = "@host_root//:usr/bin/ld",
)

cc_tool(
    name = "ar",
    src = "@host_root//:usr/bin/ar",
)

cc_tool(
    name = "objcopy",
    src = "@host_root//:usr/bin/objcopy",
)

cc_tool(
    name = "strip",
    src = "@host_root//:usr/bin/strip",
)

cc_tool_map(
    name = "host_gcc_tool_map",
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
    name = "host_gcc",
    tool_map = ":host_gcc_tool_map",
)

toolchain(
    name = "host_gcc_toolchain",
    toolchain = ":host_gcc",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)
