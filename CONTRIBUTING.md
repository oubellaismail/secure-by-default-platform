# Contributing & conventions

Solo project, but conventions keep it disciplined and reviewable.

## Branch & commit

- `main` is always demoable. Work on `feat/<topic>` or `docs/<topic>` branches.
- Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `ci:`, `refactor:`.
- Every PR (even self-merged) must pass the CI security gates before merge.

## Decisions

- Any non-trivial technology choice gets an ADR in `docs/adr/` (see the template).
- ADRs are immutable once accepted; supersede rather than edit.

## Security hygiene (dogfooding)

This repo eats its own dog food:

- No secrets in Git — enforced by Gitleaks in CI and `.gitignore`.
- Manifests are scanned (Trivy/Checkov) and must pass before merge.
- Container images produced here are scanned, SBOM'd, and signed.

## Definition of done for a platform component

1. Installed declaratively (Helm/manifest under `platform/`, synced by ArgoCD).
2. Documented in `docs/runbook/`.
3. Has at least one entry in `validation/` proving it blocks its modeled threat.
