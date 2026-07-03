# Secure-by-Default Delivery Platform

> A reusable **paved road** for shipping applications on Kubernetes where security is the
> default, not an add-on. Every project using it automatically inherits scanning, signed
> artifacts, policy enforcement, runtime protection, and observability.

A proof-of-concept demonstrating the secure-by-default delivery methodology on Kubernetes.

---

## The one idea

Make the **secure way to ship software the easy, default way** — and make insecure
artifacts *blocked by design* rather than merely flagged.

The whole platform hangs on **two load-bearing checkpoints**:

1. **CI/CD gates** — nothing gets built without passing scans and being signed.
2. **Admission control** — the cluster refuses to run anything unsigned or non-compliant.

Everything else wraps around these two gates.

## The golden path (the demo we protect above all else)

```
git push ─▶ CI scans + SBOM + sign ─▶ signed image in registry
        ─▶ ArgoCD pulls from Git ─▶ Kyverno verifies signature ─▶ runs in cluster
                                              │
                                              └─▶ unsigned/bad image is REFUSED
```

If everything else slips, this spine — push → scan → sign → GitOps → admission blocks
an unsigned image — must work and must be demoable. See [`validation/`](validation/).

## Repository layout

| Path | What lives here |
|---|---|
| [`docs/`](docs/) | Threat model, ADRs, architecture diagrams, runbook |
| [`infra/`](infra/) | Terraform + cluster bootstrap (kind / k3s / DOKS) |
| [`platform/`](platform/) | The platform components: ArgoCD, Kyverno, Falco, Cilium, secrets, observability |
| [`paved-road/`](paved-road/) | The reusable template — Helm chart + template repo (the deliverable) |
| [`sample-app/`](sample-app/) | A containerizable service used to exercise the platform end-to-end |
| [`.github/workflows/`](.github/workflows/) | The secure CI pipeline (scan → SBOM → sign) |
| [`validation/`](validation/) | Proof that controls defeat modeled threats — the differentiator |
| [`scripts/`](scripts/) | Bootstrap / teardown / demo helpers |

## Trust boundaries → threats → controls

The heart of the project. Full version in [`docs/threat-model/`](docs/threat-model/).

| Trust boundary | Threat | Control |
|---|---|---|
| Code | Vulnerable code, hardcoded secrets | SAST (Semgrep), secret scanning (Gitleaks) |
| Dependencies | Known-vulnerable libraries | SCA (Dependency-Check / Dependabot) |
| Build / IaC | Misconfigured infrastructure | Trivy / Checkov / tfsec |
| Artifact | Tampered or unverified image | SBOM (Syft) + signing (Cosign/Sigstore) |
| Deploy | Unreviewed changes to what runs | GitOps (ArgoCD) |
| Admission | Unsigned / non-compliant workloads | Policy-as-code (Kyverno) |
| Runtime | Malicious behavior at runtime | Falco (eBPF) |
| Network | Lateral movement | Cilium network policies |
| Secrets | Leaked or sprawled credentials | External Secrets Operator + Vault/KMS |
| Operations | Blind spots / no audit trail | Prometheus, Loki, Grafana |

## Status & roadmap

Tracked against the 8-week plan in [`docs/ROADMAP.md`](docs/ROADMAP.md).
**Scope-cut order if time runs short:** weeks 6–7 are droppable; weeks 1–5 already form a
complete, defensible story.

## Getting started

```bash
make help          # list all targets
make cluster-up    # stand up a local kind/k3s cluster
make bootstrap     # install platform components via ArgoCD
make demo          # run the happy-path + blocked-bad-path demo
make cluster-down  # tear down (do this when idle to save credits)
```

See [`docs/runbook/`](docs/runbook/) for detail and [`CONTRIBUTING.md`](CONTRIBUTING.md)
for conventions.

## License

[MIT](LICENSE) — see file. This is a proof-of-concept demonstrating the *methodology*;
the approach (shift-left scanning, signed artifacts, policy-as-code, GitOps) transfers to
any target environment, including serverless.
