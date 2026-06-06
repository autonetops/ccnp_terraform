# Lab 06 — Locals, Operations, and Asset Management

**Lesson:** Locais e Operações

Use **data sources** to read facts from the device (asset management is just reading inventory),
then shape them with **locals**, **expressions**, and **functions**.

## Exercise

The `data "iosxe_system"` block already fetches device facts. In `main.tf`, add a `locals` block
that derives:
- `device_name` from the system data source's `hostname` (wrap it in `try(..., "unknown")`),
- `ios_version` from the system data source's `version` (also `try(..., "unknown")`),
- `asset_tag = upper(format("CCNP-%s-%s", device_name, ios_version))`.

Uncomment the outputs.

## Run it (read-only — nothing is changed on the device)

```bash
cp ../terraform.tfvars.example terraform.tfvars
terraform init && terraform apply
terraform output asset_tag
```

## Operations recap
`terraform plan` (preview) → `terraform apply` (converge) → `terraform destroy` (remove). Because
this lab only **reads**, `destroy` has nothing to remove — that is expected for a pure data-source
config.
