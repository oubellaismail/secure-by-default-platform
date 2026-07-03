#!/usr/bin/env bash
# The demo the whole project is judged on: happy path, then blocked bad path.
# This is a scaffold with the narrative structure; fill each step as weeks land.
set -euo pipefail

pause() { echo; read -rp "  [enter to continue] " _; echo; }

echo "############################################################"
echo "# HAPPY PATH: a signed, scanned image ships end-to-end"
echo "############################################################"
echo "1. Push code -> CI runs scans, builds, SBOMs, signs (see Actions)."
echo "2. ArgoCD syncs the signed image from Git."
echo "3. Kyverno verifies the signature -> Pod is admitted and runs."
pause

echo "############################################################"
echo "# BAD PATH: an unsigned image is REFUSED by the cluster"
echo "############################################################"
echo "Attempting to run an unsigned public image directly..."
set +e
kubectl run rogue --image=nginx:latest --restart=Never -n sample-app
rc=$?
set -e
if [ "$rc" -ne 0 ]; then
  echo
  echo ">>> BLOCKED BY DESIGN: Kyverno refused the unsigned image. This is the point."
else
  echo ">>> WARNING: pod was admitted — policy not enforcing yet (still in Audit?)."
fi
