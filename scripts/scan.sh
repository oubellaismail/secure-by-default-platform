#!/usr/bin/env bash
# Run the same security gates locally that CI enforces — shift-left on the laptop.
# Requires: gitleaks, semgrep, trivy (skips gracefully if a tool is missing).
set -uo pipefail

fail=0
have() { command -v "$1" >/dev/null 2>&1; }

echo "==> Secret scanning (Gitleaks)"
if have gitleaks; then gitleaks detect --no-banner || fail=1
else echo "   skip: gitleaks not installed"; fi

echo "==> SAST (Semgrep)"
if have semgrep; then semgrep --error --config p/default . || fail=1
else echo "   skip: semgrep not installed"; fi

echo "==> Dependencies + IaC (Trivy)"
if have trivy; then
  trivy fs --scanners vuln --severity CRITICAL,HIGH --exit-code 1 . || fail=1
  trivy config --severity CRITICAL,HIGH --exit-code 1 . || fail=1
else echo "   skip: trivy not installed"; fi

[ "$fail" -eq 0 ] && echo "==> All available gates passed" || echo "==> Gates FAILED"
exit "$fail"
