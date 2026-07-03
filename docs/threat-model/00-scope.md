# Phase 0 — Scope statement

> Status: DRAFT — fill in Week 1.

## What "secure-by-default delivery" means here

A new project adopting the paved road inherits, without manual wiring: shift-left
scanning, signed artifacts with provenance, GitOps delivery, policy-based admission,
runtime detection, network isolation, managed secrets, and security observability.
Insecure artifacts are **blocked by design**, not merely flagged.

## Assets to protect

- Source code and its integrity.
- Build pipeline and its credentials.
- Container images and their provenance.
- The cluster and the workloads it runs.
- Secrets (credentials, tokens, keys).
- The audit trail / ability to detect and investigate.

## Actors

- Legitimate developer (trusted, may make mistakes).
- Malicious insider or compromised developer account.
- External attacker targeting the supply chain (dependency, base image, registry).
- Compromised workload attempting lateral movement at runtime.

## Trust boundaries

Code → Dependencies → Build/IaC → Artifact → Deploy → Admission → Runtime → Network →
Secrets → Operations. (See `02-control-map.md` for the full boundary-threat-control table.)

## Assumptions & constraints

- 2-month solo remote POC; breadth is the primary risk.
- Local cluster (kind/k3s) or DOKS; tear down when idle to control cost.
- Demonstrates the *methodology*; not enterprise-scale production hardening.

## Explicitly out of scope

Multi-cloud/enterprise hardening; DAST beyond basic; compliance certification
(SOC 2 / ISO 27001); full SIEM / IR tooling.
