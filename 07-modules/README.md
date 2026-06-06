# Lab 07 — Refactoring into Modules

**Lesson:** Módulos

Take the flat config from Lab 03 and refactor it into four reusable child modules:
`vlan`, `interface`, `ospf`, `acl`. The root module just *calls* them with inputs.

## Exercise

Each module under `modules/` has complete `variables.tf`/`outputs.tf` but a `TODO` in its
`main.tf`. Implement the `resource` block in each module so the root config applies cleanly,
then uncomment each module's output and the root outputs.

## Run it
```bash
cp ../terraform.tfvars.example terraform.tfvars
terraform init      # resolves ./modules/* and downloads the provider
terraform plan && terraform apply
```

## Verify
```bash
ssh admin@sandbox-iosxe-latest-1.cisco.com
show vlan brief | include 771|772
show access-lists CCNP_GUARD_MOD
```

## Clean up
```bash
terraform destroy
```

Compare with `solution/` — note how the root module reads top-down as intent, with the "how"
hidden inside each module.
