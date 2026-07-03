# Roadmap — 8-week plan (July–August 2026)

Phase shape: **design (wks 1–2) → build (wks 3–6) → prove/generalize/communicate (wks 7–8)**.

Status values: `TODO` / `WIP` / `DONE` / `CUT`

| Week | Theme | Key output | Status |
|---|---|---|---|
| 1 | Foundation & threat model | Cluster + Terraform base; threat model doc | TODO |
| 2 | Secure CI pipeline | GH Actions: Semgrep, SCA, Gitleaks, Trivy; app builds & pushes | TODO |
| 3 | Supply chain | SBOM (Syft) + signing (Cosign/Sigstore) + attestations | TODO |
| 4 | GitOps delivery | ArgoCD pull-based deploy of sample app | TODO |
| 5 | Admission control | Kyverno: block unsigned, require limits, deny privileged | TODO |
| 6 | Runtime & secrets | Falco; External Secrets + Vault; Cilium network policies | TODO |
| 7 | Observability & paved road | Loki/Grafana security signals; package the template | TODO |
| 8 | Polish, demo, report | Record demos; docs; final report; buffer | TODO |

## The non-negotiable spine

Protect the **golden path** from week 1: `push → scan → sign → GitOps → admission blocks
unsigned image`. Weeks 1–5 deliver this. Everything after is decoration on the spine.

## Scope-cut order (pre-agreed)

1. Cut first: **Week 6** (Falco / Cilium / Vault — most over-loaded, sharpest edges).
2. Cut second: **Week 7** observability depth (keep a minimal Grafana).
3. Never cut: the **validation report** — it is what makes this a *security* project.

## Phase → deliverable map

- Phase 0 Context → `docs/threat-model/00-scope.md`
- Phase 1 Threat model → `docs/threat-model/`
- Phase 2 Architecture → `docs/diagrams/` + `docs/adr/`
- Phase 3 Detailed design → `docs/DESIGN.md`
- Phase 4 Implementation → `platform/`, `.github/workflows/`, `sample-app/`
- Phase 5 Validation → `validation/`
- Phase 6 Productization → `paved-road/`
- Phase 7 Docs & handover → `docs/runbook/`, demo, final report
