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

# Read device identity facts — no arguments required
data "iosxe_system" "facts" {}

locals {
  device_name = try(data.iosxe_system.facts.hostname, "unknown")
  ios_version = try(data.iosxe_system.facts.version, "unknown")
  asset_tag   = upper(format("CCNP-%s-%s", local.device_name, local.ios_version))
}
