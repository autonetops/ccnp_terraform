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

resource "iosxe_interface_loopback" "lab02_loopback" {
  name        = "101"
  description = "Loopback interface created by Terraform in CCNP Lab 02"
  shutdown    = false
}
