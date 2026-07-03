# Kyverno

Policy-as-code admission control (Week 5). Install via ArgoCD.
Policies live in `policies/`:
- `verify-image-signature.yaml` — the second checkpoint: refuse unsigned images.
- `pod-security-baseline.yaml` — non-root, no privilege, resource limits.

Rollout: start each policy in `Audit`, confirm, then flip to `Enforce`.
