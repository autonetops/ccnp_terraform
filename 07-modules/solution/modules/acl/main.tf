terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

resource "iosxe_access_list_extended" "this" {
  name = var.name

  entries = [
    {
      sequence                = 10
      ace_rule_action         = "permit"
      ace_rule_protocol       = "tcp"
      source_prefix           = "10.71.0.0"
      source_prefix_mask      = "0.0.0.255"
      destination_prefix      = "10.72.0.0"
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
