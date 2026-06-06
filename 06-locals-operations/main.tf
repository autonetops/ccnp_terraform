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

# TODO(exercise): build a locals block:
#   device_name from the hostname data source (use try() for safety),
#   asset_tag = upper(format("CCNP-%s", device_name)).
# Reference: solution/main.tf
