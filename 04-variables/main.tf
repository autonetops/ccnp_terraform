terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~> 0.18"
    }
  }
}

provider "iosxe" {
  protocol = "restconf"
  host     = var.host
  username = var.username
  password = var.password
  insecure = true
}

# TODO(exercise): use for_each over var.vlans to create one iosxe_vlan per entry.
# Reference: solution/main.tf
