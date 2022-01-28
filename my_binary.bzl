def _impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._binary_template,
        output = ctx.outputs.out,
        substitutions = {
            "%single_arch_cpu%": ctx.fragments.apple.single_arch_cpu,
            "%platform%": str(ctx.fragments.platform.platform),
            "%host_platform%": str(ctx.fragments.platform.host_platform),
            "%cpu%": ctx.var["TARGET_CPU"],
        },
        is_executable = True,
    )
    return DefaultInfo(executable = ctx.outputs.out)

my_binary = rule(
    _impl,
    attrs = {
        "out": attr.output(),
        "_binary_template": attr.label(
            allow_single_file = True,
            default = Label("//:binary.sh.tpl"),
        ),
    },
    fragments = ["apple", "platform"],
)
