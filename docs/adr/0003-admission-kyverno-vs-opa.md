# ADR-0003: Admission control — Kyverno vs OPA Gatekeeper

- **Status:** Proposed
- **Date:** 2026-07-03
- **Deciders:** Oubella Ismail

## Context

The cluster must refuse unsigned or non-compliant workloads. Policies needed: verify
Cosign image signatures, require resource limits, deny privileged containers. This is one
of the two load-bearing checkpoints, so clarity and demonstrability matter.

## Options considered

1. **Kyverno** — policies are YAML (no new language), native `verifyImages` for Cosign,
   readable in a demo, strong Kubernetes-native feel.
2. **OPA Gatekeeper** — Rego is powerful and portable beyond K8s, but a steeper learning
   curve and less readable for a defense audience.

## Decision

*Pending Week 5.* Leaning **Kyverno** — YAML policies and first-class Cosign image
verification make the signing-to-admission link easy to build and to demonstrate.

## Consequences

- Confirm once "unsigned image is refused" is demonstrated in Week 5.
- Trade-off: Rego skills are more transferable, but demonstrability wins for this POC.
