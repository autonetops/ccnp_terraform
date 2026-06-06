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

module "vlans" {
  source = "./modules/vlan"
  vlans  = { USERS = 771, SERVERS = 772 }
}

module "interfaces" {
  source = "./modules/interface"
  loopbacks = {
    771 = { description = "USERS L3", ip = "10.71.0.1", mask = "255.255.255.0" }
    772 = { description = "SERVERS L3", ip = "10.72.0.1", mask = "255.255.255.0" }
  }
}

module "ospf" {
  source     = "./modules/ospf"
  process_id = 10
  router_id  = "10.0.0.77"
  networks = [
    { ip = "10.71.0.0", wildcard = "0.0.0.255", area = "0" },
    { ip = "10.72.0.0", wildcard = "0.0.0.255", area = "0" },
  ]
  depends_on = [module.interfaces]
}

module "acl" {
  source = "./modules/acl"
  name   = "CCNP_GUARD_MOD"
}
