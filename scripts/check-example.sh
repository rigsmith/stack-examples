#!/usr/bin/env bash
# Usage: check-example.sh <example-dir> <generated-file>
#
# Copies the example somewhere disposable, makes it a git repo — `rig stack`
# works on one, and these directories live inside a larger repo — deletes the
# committed overlay, regenerates it, and diffs.
#
# The copy matters: regenerating in place would leave the working tree dirty and
# make a failure look like an edit somebody made.
set -euo pipefail

example="${1:?example directory}"
generated="${2:?generated file}"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
cp -R "$example/." "$work/"

git -C "$work" init -q -b main
git -C "$work" add -A
git -C "$work" -c user.email=ci@example.com -c user.name=ci commit -qm "example"

rm -f "$work/$generated"
(cd "$work" && rig stack wire)

if ! diff -u "$example/$generated" "$work/$generated"; then
  echo
  echo "$example/$generated is not what \`rig stack wire\` now writes."
  echo "Either rig changed and the example needs regenerating, or it regressed."
  exit 1
fi
echo "$example/$generated matches what rig writes"
