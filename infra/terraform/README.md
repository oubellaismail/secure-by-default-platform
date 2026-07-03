# Terraform

Cluster + base provisioning. Local kind needs almost none; DOKS path lives here (see ADR-0001). Keep `*.tfstate` and `*.tfvars` out of Git (see .gitignore).

Usage: copy `example.tfvars` to `terraform.tfvars`, then `terraform init && terraform plan`.
