# Detailed design (Phase 3)

> Status: DRAFT — expand during weeks 2–4 as components come online.

## The path a change travels

```
Developer pushes to Git
        |
        v
CI/CD security gates      -> scan (SAST, SCA, secrets, IaC), generate SBOM, sign image
        |
        v
Image registry            -> signed image + provenance attestation
        |
        v
GitOps + admission        -> ArgoCD pulls from Git; Kyverno verifies signature/policy
        |
        v
Kubernetes cluster        -> Cilium isolation, Falco runtime detection, managed secrets
        |
        +-----------------> Observability (Loki, Grafana, Prometheus)
```

## The two load-bearing checkpoints

1. **CI/CD gates** (`.github/workflows/secure-ci.yml`) — nothing is built or pushed
   without passing scans and being signed.
2. **Admission control** (`platform/kyverno/policies/`) — the cluster refuses to run
   anything unsigned or non-compliant.

Everything else wraps around these two gates.

## Component design notes (to fill in)

- **Pipeline stages & triggers** — gate order, fail-fast behavior, caching.
- **Signing / verification flow** — cosign keyless identity, Rekor, the exact subject
  Kyverno trusts. Keep the CI signing identity and the Kyverno `subject`/`issuer` in sync.
- **GitOps repo structure** — app-of-apps layout, sync waves, prune/self-heal.
- **Admission policies** — Audit-then-Enforce rollout; failurePolicy considerations.
- **Secrets flow** — ESO SecretStore, refresh interval, what Vault holds.
- **Observability wiring** — which security signals (Falco events, admission denials,
  policy reports) land in Grafana and how they are alerted.

## Open design decisions

Tracked as ADRs in `docs/adr/`. Key pending: GitOps engine (0002), admission engine
(0003), secrets backend (0004).
