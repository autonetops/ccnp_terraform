terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

# TODO(exercise): create an iosxe_ospf resource using var.process_id, var.router_id, var.networks.
# Reference: ../../solution/modules/ospf/main.tf
