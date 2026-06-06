# Lab 04 — Variables, tfvars, Types, and Validation

**Lesson:** Variaveis

Replace hardcoded VLANs with a typed, validated `map(number)` variable and `for_each`.

## Exercise

1. In `variables.tf`, define `vlans` as `map(number)` with a `validation` block enforcing
   2–4094, defaulting to `{ USERS = 741, SERVERS = 742 }`.
2. In `main.tf`, create one `iosxe_vlan` per entry using `for_each`.
3. Uncomment the output.

Try breaking it: set a VLAN id to `9999` and run `terraform plan` — you should see the
validation error.

## Run it
```bash
cp ../terraform.tfvars.example terraform.tfvars
terraform init && terraform plan && terraform apply
```

## Clean up
```bash
terraform destroy
```
