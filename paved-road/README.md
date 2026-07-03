# The paved road (Phase 6 — the deliverable)

The reusable template that lets a new project bootstrap secure in minutes. This is what
"secure-by-default" ships as: a new service adopts the full platform by using this, not by
re-wiring security by hand.

## Contents

- `helm-chart/` — an opinionated chart that renders a workload already compliant with the
  admission policies (non-root, limits, no privilege escalation) and wired for signing,
  GitOps, and observability.
- `template-repo/` — a GitHub template repository skeleton: the secure CI workflow, a
  Dockerfile baseline, an ArgoCD Application, and a pre-filled `values.yaml`.

## Adoption story (the success criterion)

```
1. Use the template repo         -> secure CI is already wired.
2. Set image name + owner        -> signing identity flows through.
3. Commit                        -> ArgoCD deploys it, Kyverno verifies it.
```

A new sample project adopting this with minimal effort is one of the brief's success
criteria — keep the adoption path short and documented.
