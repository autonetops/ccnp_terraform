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

# --- VLANs (worked example) ---

resource "iosxe_vlan" "users" {
  vlan_id  = 731
  name     = "USERS"
  shutdown = false
}

resource "iosxe_vlan" "servers" {
  vlan_id  = 732
  name     = "SERVERS"
  shutdown = false
}

# TODO(exercise) A: add two iosxe_interface_loopback (731 -> 10.31.0.1/24, 732 -> 10.32.0.1/24).
# TODO(exercise) B: add iosxe_ospf process 10, router-id 10.0.0.73, advertise both loopback subnets in area 0.
# TODO(exercise) C: add extended ACL "CCNP_GUARD": permit tcp 10.31.0.0/24 -> 10.32.0.0/24 eq 443, then deny ip any any.
# Reference: solution/main.tf
