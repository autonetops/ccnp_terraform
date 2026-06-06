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

resource "iosxe_interface_loopback" "state_demo" {
  name              = 1751
  description       = "ccnp lab05 state demo"
  ipv4_address      = "172.51.0.1"
  ipv4_address_mask = "255.255.255.255"
  shutdown          = false
}
