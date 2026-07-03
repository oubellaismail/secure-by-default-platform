# Secure-by-Default Delivery Platform — task runner
# Convention: every target is idempotent and safe to re-run.

CLUSTER_NAME ?= sbdp
KIND_CONFIG  ?= infra/cluster/kind-config.yaml
SAMPLE_IMG   ?= ghcr.io/oubellaismail/sbdp-sample-app:dev

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

## ---- Cluster lifecycle ----------------------------------------------------

.PHONY: cluster-up
cluster-up: ## Stand up a local kind cluster
	kind create cluster --name $(CLUSTER_NAME) --config $(KIND_CONFIG)

.PHONY: cluster-down
cluster-down: ## Tear down the local cluster (do this when idle)
	kind delete cluster --name $(CLUSTER_NAME)

## ---- Platform bootstrap ---------------------------------------------------

.PHONY: bootstrap
bootstrap: ## Install ArgoCD then let it sync the platform (app-of-apps)
	./scripts/bootstrap.sh

## ---- CI-equivalent local checks -------------------------------------------

.PHONY: scan
scan: ## Run the local security scan suite (SAST, secrets, SCA, IaC)
	./scripts/scan.sh

.PHONY: sbom
sbom: ## Generate an SBOM for the sample app image
	syft $(SAMPLE_IMG) -o spdx-json=sample-app.sbom.json

.PHONY: sign
sign: ## Sign the sample app image with cosign (keyless)
	cosign sign --yes $(SAMPLE_IMG)

.PHONY: verify
verify: ## Verify the signature of the sample app image
	cosign verify $(SAMPLE_IMG)

## ---- Validation & demo ----------------------------------------------------

.PHONY: demo
demo: ## Run happy-path + blocked-bad-path demo
	./scripts/demo.sh

.PHONY: validate
validate: ## Run the validation suite (prove controls block threats)
	./scripts/validate.sh

.PHONY: lint
lint: ## Lint manifests and Helm charts
	helm lint paved-road/helm-chart
	kubectl apply --dry-run=client -R -f platform/ >/dev/null
