# CCNP AUTOCOR — Terraform for Network Automation (Hands-on Labs)

Hands-on labs for blueprint topic **1.2 — Construct a network automation solution with
Terraform** (VLANs, OSPF, interface settings, ACLs, asset management). These labs back the
"Terraform" chapter of the AutoNetOps course.

## What you need

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.6
- Internet access to the **Cisco DevNet always-on IOS XE sandbox** (no reservation needed):
  - URL: `https://sandbox-iosxe-latest-1.cisco.com`
  - Username: `admin`  Password: `C1sco12345`
- Git, to clone this repo.

> **Heads up — device type matters.** Always run `terraform destroy` when you finish a lab so you
> leave the device clean. Interface labs use **loopbacks** so they work on any IOS XE device.
>
> **VLAN labs need a switch.** The VLAN resource (`iosxe_vlan`) requires a **Catalyst switch**
> (e.g. a Cat9k sandbox). A virtual **router** like the Catalyst 8000V has no VLAN database — its
> YANG model has no `vlan-list`, so `terraform apply` on labs `02`, `04`, and the VLAN module in
> `07` will be refused with an `unknown element: vlan-list` error. Labs `01`, `03` (interfaces +
> OSPF + ACL), `05`, and `06` run on a router or a switch. Point `host` at a switch sandbox
> for the VLAN labs.

## How the labs work

Each `0X-*` folder is one lesson and is fully self-contained:

```
0X-name/
├── README.md      ← the exercise: what to build and how to verify
├── main.tf        ← STARTER: has a TODO where you write the resource
├── variables.tf
├── outputs.tf
└── solution/      ← the complete, working answer
```

Workflow for each lab:

```bash
cd 0X-name
cp ../terraform.tfvars.example terraform.tfvars   # first time only; edit if needed
terraform init
# ... solve the TODO in main.tf (peek at solution/ if stuck) ...
terraform plan
terraform apply
# ... verify on the device (each README shows how) ...
terraform destroy
```

## Labs

| # | Folder | Topic |
|---|--------|-------|
| 1 | `01-terraform` | The Terraform workflow: init → plan → apply → destroy |
| 2 | `02-providers` | The `iosxe` provider over RESTCONF |
| 3 | `03-configuration` | VLANs, interfaces, OSPF, ACLs in one config |
| 4 | `04-variables` | Variables, `.tfvars`, types, validation |
| 5 | `05-state` | Terraform state: `tfstate`, `state list/show`, drift |
| 6 | `06-locals-operations` | Locals, expressions, `for_each`, and asset inventory via data sources |
| 7 | `07-modules` | Refactoring into reusable modules |

## Credentials

Never commit `terraform.tfvars`. It is gitignored. Copy `terraform.tfvars.example` and fill it in.
You can also export `IOSXE_USERNAME` / `IOSXE_PASSWORD` instead of putting them in tfvars.

> If `apply` returns **HTTP 401 / access-denied** or a NETCONF SSH auth error, your sandbox
> credentials are wrong or expired. Always-on sandbox credentials rotate — confirm the current
> username/password on the [Cisco DevNet sandbox page](https://developer.cisco.com/site/sandbox/)
> and update `terraform.tfvars`.

## Provider protocol

These labs talk to IOS XE over **RESTCONF**, so every `provider "iosxe"` block sets
`protocol = "restconf"`. The `CiscoDevNet/iosxe` provider (v0.18+) defaults to **NETCONF**; without
this line you would get a NETCONF SSH connection instead of the RESTCONF/HTTPS transport the course
teaches.
