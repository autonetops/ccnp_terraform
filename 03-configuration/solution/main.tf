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

# --- VLANs ---

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

# --- Loopback interfaces (L3 SVIs) ---

resource "iosxe_interface_loopback" "users_svi" {
  name              = 731
  description       = "USERS L3"
  ipv4_address      = "10.31.0.1"
  ipv4_address_mask = "255.255.255.0"
  shutdown          = false
}

resource "iosxe_interface_loopback" "servers_svi" {
  name              = 732
  description       = "SERVERS L3"
  ipv4_address      = "10.32.0.1"
  ipv4_address_mask = "255.255.255.0"
  shutdown          = false
}

# --- OSPF ---

resource "iosxe_ospf" "core" {
  process_id = 10
  router_id  = "10.0.0.73"

  networks = [
    {
      ip       = "10.31.0.0"
      wildcard = "0.0.0.255"
      area     = "0"
    },
    {
      ip       = "10.32.0.0"
      wildcard = "0.0.0.255"
      area     = "0"
    },
  ]
}

# --- Extended ACL ---

resource "iosxe_access_list_extended" "guard" {
  name = "CCNP_GUARD"

  entries = [
    {
      sequence                = 10
      ace_rule_action         = "permit"
      ace_rule_protocol       = "tcp"
      source_prefix           = "10.31.0.0"
      source_prefix_mask      = "0.0.0.255"
      destination_prefix      = "10.32.0.0"
      destination_prefix_mask = "0.0.0.255"
      destination_port_equal  = "443"
    },
    {
      sequence          = 20
      ace_rule_action   = "deny"
      ace_rule_protocol = "ip"
      source_any        = true
      destination_any   = true
    },
  ]
}
