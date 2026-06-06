terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

resource "iosxe_interface_loopback" "this" {
  for_each          = var.loopbacks
  name              = tonumber(each.key)
  description       = each.value.description
  ipv4_address      = each.value.ip
  ipv4_address_mask = each.value.mask
  shutdown          = false
}
