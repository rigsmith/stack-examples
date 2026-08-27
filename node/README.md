# An npm stackspace — layout only

The git half works here exactly as it does anywhere: `rig stack init` fuses the
repos, a commit spans them, `send` and `push` take work back out.

**The build half is not implemented for npm yet.** `rig stack wire` reports that
it skipped, rather than pretending. npm has more than one way to do this — an
`overrides` block, a `workspaces` array, a linked dependency — and picking one
without a real repository to check it against is how you end up with a
generator nobody can use.

Until then, wire it by hand with whichever of those suits your setup. The
manifest and the layout below are the parts that are already right.

If you want this, the implementation goes in `core/ecosystem/node` as a
`LocalOverlay` method — the same one the .NET and Go adapters implement — and
this directory becomes its test.
