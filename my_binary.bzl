def _impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._binary_template,
        output = ctx.outputs.out,
        substitutions = {"%CPU%": ctx.fragments.apple.single_arch_cpu},
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
    fragments = ["apple"],
)
