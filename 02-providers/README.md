# Lab 02 — Providers over RESTCONF

**Lesson:** Providers

Configure the `iosxe` provider to talk to an IOS XE device over **RESTCONF**, supplying the
device URL and credentials as Terraform variables.

## Exercise

1. Copy the example tfvars and fill in your device URL and credentials:
   ```bash
   cp ../terraform.tfvars.example terraform.tfvars
   ```
2. In `main.tf`, replace the `TODO` with an `iosxe_interface_loopback`: number **101**, a description, not shut down.
3. Uncomment the outputs.

## Run it

```bash
terraform init && terraform plan && terraform apply
```

## Verify

```bash
ssh admin@sandbox-iosxe-latest-1.cisco.com
show interfaces Loopback101
```

## Clean up
```bash
terraform destroy
```
