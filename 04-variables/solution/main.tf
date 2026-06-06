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

resource "iosxe_vlan" "fleet" {
  for_each = var.vlans
  vlan_id  = each.value
  name     = each.key
  shutdown = false
}
