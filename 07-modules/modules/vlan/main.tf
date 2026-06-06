terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

# TODO(exercise): create one iosxe_vlan per entry in var.vlans using for_each.
# Reference: ../../solution/modules/vlan/main.tf
