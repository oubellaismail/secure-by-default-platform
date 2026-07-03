# Threat-to-control map

The bridge between the threat model (why) and the stack (what). This table is the source
of truth for the validation suite: every row must have a matching entry in `validation/`.

| # | Trust boundary | Threat (STRIDE) | Control | Tool | Validated in |
|---|---|---|---|---|---|
| 1 | Code | Vulnerable code (Tampering/EoP) | SAST | Semgrep | `validation/01-sast.md` |
| 2 | Code | Hardcoded secret (Info disclosure) | Secret scanning | Gitleaks | `validation/02-secrets.md` |
| 3 | Dependencies | Known-vulnerable library (EoP) | SCA | Dependency-Check / Dependabot | `validation/03-sca.md` |
| 4 | Build / IaC | Misconfigured infra (Tampering) | IaC scanning | Trivy / Checkov / tfsec | `validation/04-iac.md` |
| 5 | Artifact | Tampered / unverified image (Tampering) | SBOM + signing | Syft + Cosign | `validation/05-signing.md` |
| 6 | Deploy | Unreviewed change to what runs (Repudiation) | GitOps, Git as source of truth | ArgoCD | `validation/06-gitops.md` |
| 7 | Admission | Unsigned / non-compliant workload (Spoofing) | Policy-as-code admission | Kyverno | `validation/07-admission.md` |
| 8 | Runtime | Malicious runtime behavior (Tampering/EoP) | eBPF runtime detection | Falco | `validation/08-runtime.md` |
| 9 | Network | Lateral movement (EoP) | Network policies | Cilium | `validation/09-network.md` |
| 10 | Secrets | Leaked / sprawled credentials (Info disclosure) | External secrets store | ESO + Vault/KMS | `validation/10-secrets-mgmt.md` |
| 11 | Operations | Blind spots / no audit (Repudiation) | Security observability | Prometheus, Loki, Grafana | `validation/11-observability.md` |

## How to read this

- **STRIDE** = Spoofing, Tampering, Repudiation, Information disclosure, Denial of
  service, Elevation of privilege.
- Rows 1–7 are the **non-negotiable spine** (weeks 1–5). Rows 8–11 are weeks 6–7 and are
  in the pre-agreed scope-cut zone.
