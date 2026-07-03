# ADR-0004: Secrets backend — External Secrets Operator + Vault vs cloud KMS

- **Status:** Proposed
- **Date:** 2026-07-03
- **Deciders:** Oubella Ismail

## Context

Secrets must not live in Git or in plain manifests. Workloads need to consume them without
sprawl. This is Week 6, inside the scope-cut zone, so favor the lowest-effort option that
still tells the story.

## Options considered

1. **External Secrets Operator (ESO) + HashiCorp Vault** — self-contained, runs on the
   local cluster, portable, good learning value. More moving parts to stand up.
2. **ESO + cloud secret store (AWS/GCP)** — closer to real ops, but adds cloud dependency
   and cost to a local POC.

## Decision

*Pending Week 6.* Leaning **ESO + Vault (dev mode)** for a self-contained local demo, with
the cloud-KMS path documented as the production mapping.

## Consequences

- Keep this minimal; Week 6 is the first to cut if time runs short.
- Follow-up: note the ESO SecretStore swap to cloud KMS in the runbook.
