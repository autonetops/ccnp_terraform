# Lab 03 — Configuring VLANs, Interfaces, OSPF, and ACLs

**Lesson:** Configurações

Define all four CCNP 1.2 configuration domains in one Terraform config. The two VLANs are done
for you as a worked example; you complete the interfaces, OSPF, and the ACL.

## Exercise

- **A. Interfaces:** two loopbacks — `Loopback731` = 10.31.0.1/24, `Loopback732` = 10.32.0.1/24.
- **B. OSPF:** process **10**, router-id **10.0.0.73**, advertise both loopbacks in **area 0**.
- **C. ACL:** extended ACL **CCNP_GUARD** — `permit tcp 10.31.0.0/24 -> 10.32.0.0/24 eq 443`,
  then `deny ip any any`.

Uncomment the outputs when done.

## Run it

```bash
cp ../terraform.tfvars.example terraform.tfvars
terraform init && terraform plan && terraform apply
```

## Verify

```bash
ssh admin@sandbox-iosxe-latest-1.cisco.com
show vlan brief | include 731|732
show ip ospf interface brief
show access-lists CCNP_GUARD
```

## Clean up
```bash
terraform destroy
```
