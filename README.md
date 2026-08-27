# Stack examples

What a [stackspace](https://rigsmith.dev/rig/stack) looks like, so you can see
the shape before spending an hour on your own.

A stackspace fuses your app and the libraries you have had to fork into one git
history, each under its own directory. A change spans them in a single commit,
the build compiles against source rather than packages, and every project still
leaves as itself — a pull request to a fork you contribute to, or a
fast-forward of a repository you own.

Each directory here is one, after import, with the build wiring in place:

| | |
|---|---|
| [`dotnet/`](dotnet) | a `Directory.Build.targets` redirecting a `PackageReference` |
| [`go/`](go) | a `go.work` making a `require` read the tree instead of the proxy |
| [`node/`](node) | the layout — the wiring is not implemented yet |

## These are tests

Every example is checked by CI, not just written down. For each one it copies
the directory, runs `rig stack wire`, and fails if the result differs from the
file committed here — then builds the app to prove the redirect took effect.

So an example cannot quietly rot into something that no longer works, which is
the usual fate of a directory called `examples`.

## What you will not find here

The fused git history. Importing needs real upstream repositories, and these
directories are checked in rather than imported, so there are no `lastSync`
cursors and `rig stack pull` has nothing to talk to. Everything else — the
manifest, the layout, the overlay — is exactly what you get.

Start with [the guide](https://rigsmith.dev/rig/stack); come back here when you
want to see it rather than read it.
