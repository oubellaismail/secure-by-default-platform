# ADR-0002: GitOps engine — ArgoCD vs Flux

- **Status:** Proposed
- **Date:** 2026-07-03
- **Deciders:** Oubella Ismail

## Context

Delivery must be pull-based and auditable (Git as the single source of truth for what
runs). Need an app-of-apps pattern to bootstrap the whole platform.

## Options considered

1. **ArgoCD** — strong UI for demos, app-of-apps is first-class, large community, easy to
   show reviewers a sync/diff visually. Heavier footprint.
2. **Flux** — lighter, more CLI/GitOps-native, composable controllers. Weaker built-in UI
   for a demo audience.

## Decision

*Pending Week 4.* Leaning **ArgoCD** — the visual sync/diff is valuable for the demo and
final defense, and app-of-apps cleanly bootstraps every platform component.

## Consequences

- To confirm once the sample app deploys via GitOps in Week 4.
- Revisit trigger: if footprint on the local cluster becomes a problem, reassess Flux.
