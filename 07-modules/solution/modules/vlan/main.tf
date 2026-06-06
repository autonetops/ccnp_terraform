terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

resource "iosxe_vlan" "this" {
  for_each = var.vlans
  vlan_id  = each.value
  name     = each.key
  shutdown = false
}
