# ADR-0001: POC target environment — Kubernetes (local kind/k3s, DOKS optional)

- **Status:** Accepted
- **Date:** 2026-07-03

## Context

The reference production target is AWS-serverless and does not use Docker/Kubernetes. This
is a proof of concept of the secure-by-default *approach* on a platform of choice. The full
set of controls (admission control, runtime security, network policy) needs an environment
that can demonstrate them end-to-end. Cloud cost must be controlled over a 2-month solo POC.

## Options considered

1. **Kubernetes on local kind/k3s** — full control set demonstrable; near-zero cost.
   Not the reference production stack.
2. **Managed Kubernetes (DOKS)** — closer to real ops; costs credits; teardown discipline
   needed.
3. **Drop directly into AWS serverless** — matches the reference stack, but admission
   control / runtime security / network policy have no clean equivalent to demonstrate the
   thesis.

## Decision

Build the POC on **Kubernetes**, defaulting to **local kind/k3s** with **DOKS as an
optional swap**. The methodology (shift-left scanning, signed artifacts, policy-as-code,
GitOps) transfers to any target, including serverless.

## Consequences

- Positive: the complete secure-by-default story is demonstrable end-to-end.
- Trade-off accepted: POC demonstrates the *approach*, not a drop-in for the reference stack.
- Follow-up: document the serverless mapping in the final report as future work.
