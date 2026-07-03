#!/usr/bin/env bash
# Install ArgoCD, then hand control to the app-of-apps so the platform installs itself.
set -euo pipefail

echo "==> Installing ArgoCD"
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "==> Waiting for ArgoCD server to be ready"
kubectl rollout status -n argocd deploy/argocd-server --timeout=180s

echo "==> Applying app-of-apps (platform bootstraps from Git)"
kubectl apply -f platform/argocd/app-of-apps.yaml

echo "==> Done. Initial admin password:"
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath='{.data.password}' | base64 -d; echo
echo "Port-forward with: kubectl -n argocd port-forward svc/argocd-server 8080:443"
