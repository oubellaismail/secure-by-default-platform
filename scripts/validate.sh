#!/usr/bin/env bash
# Validation suite: prove each modeled threat is defeated by its control.
# Each check corresponds to a row in docs/threat-model/02-control-map.md and a file
# in validation/. Scaffold — implement checks as the matching week lands.
set -uo pipefail

pass=0; fail=0
check() { # check "<name>" <cmd...>  — expects cmd to succeed
  echo "==> $1"; shift
  if "$@"; then echo "   PASS"; pass=$((pass+1)); else echo "   FAIL"; fail=$((fail+1)); fi
}

# Example wired check: unsigned image must be rejected by admission.
reject_unsigned() {
  ! kubectl run vtest --image=nginx:latest --restart=Never -n sample-app \
      --dry-run=server >/dev/null 2>&1
}

check "07 admission: unsigned image is rejected" reject_unsigned

# TODO: add checks 01-06, 08-11 as their controls come online.

echo
echo "==> validation summary: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
