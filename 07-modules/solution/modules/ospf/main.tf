terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

resource "iosxe_ospf" "this" {
  process_id = var.process_id
  router_id  = var.router_id
  networks   = var.networks
}
