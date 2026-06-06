terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

# TODO(exercise): create one iosxe_interface_loopback per entry in var.loopbacks using for_each.
# Reference: ../../solution/modules/interface/main.tf
