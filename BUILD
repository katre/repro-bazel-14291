load(":my_binary.bzl", "my_binary")
load(":my_rule.bzl", "my_rule")

my_binary(
    name = "bin",
    out = "bin.exe",
)

my_rule(
    name = "a",
    out = "a.out",
    tool = ":bin",
)

platform(
    name = "macos_arm64",
    constraint_values = [
        "@platforms//cpu:arm64",
        "@platforms//os:macos",
    ],
)
