# Platform components

Each subdirectory is one platform capability, installed declaratively and synced by
ArgoCD (app-of-apps in `argocd/`). A component is "done" only when it is (1) installed via
Git, (2) documented in `docs/runbook/`, and (3) proven in `validation/`.

| Dir | Component | Control | Week |
|---|---|---|---|
| `argocd/` | GitOps delivery | Auditable, pull-based deploy | 4 |
| `kyverno/` | Admission control | Block unsigned / non-compliant | 5 |
| `falco/` | Runtime detection (eBPF) | Detect malicious runtime behavior | 6 |
| `cilium/` | Network policy | Prevent lateral movement | 6 |
| `secrets/` | External Secrets + Vault | No secrets in Git | 6 |
| `observability/` | Prometheus, Loki, Grafana | Audit trail, security signals | 7 |

Weeks 6–7 are the pre-agreed scope-cut zone. Rows for weeks 4–5 are the spine.
