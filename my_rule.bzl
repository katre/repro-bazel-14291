def _impl(ctx):
    ctx.actions.run(
        executable = ctx.executable.tool,
        arguments = [ctx.outputs.out.path],
        outputs = [ctx.outputs.out],
    )
    return DefaultInfo(files = depset([ctx.outputs.out]))

my_rule = rule(
    _impl,
    attrs = {
        "out": attr.output(),
        "tool": attr.label(
            cfg = "exec",
            executable = True,
        ),
    },
    fragments = ["apple"],
)
