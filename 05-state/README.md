# Lab 05 — Terraform State

**Lesson:** Estado

Terraform records what it manages in a **state file** (`terraform.tfstate`). This lab is a guided
tour of that file. The config is already written; you drive the state CLI.

## Exercise

```bash
cp ../terraform.tfvars.example terraform.tfvars
terraform init
terraform apply                       # creates terraform.tfstate

# 1. Inspect state
terraform state list                  # list managed resources
terraform state show iosxe_interface_loopback.state_demo

# 2. See it's just JSON (local backend)
cat terraform.tfstate | head -40

# 3. Simulate drift: change the description directly on the device, then:
terraform plan                        # Terraform detects the difference

# 4. Remove a resource from state WITHOUT deleting it on the device:
terraform state rm iosxe_interface_loopback.state_demo
terraform state list                  # now empty
terraform import iosxe_interface_loopback.state_demo Loopback1751   # bring it back
```

## Why local-only here

These labs use the **default local backend** on purpose — it keeps the state visible and simple
while you learn. In production you would use a remote backend (e.g. Terraform Cloud, S3) so a team
shares one locked state. That is out of scope for this course.

## Clean up
```bash
terraform destroy
```
