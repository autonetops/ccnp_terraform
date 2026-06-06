output "ids" {
  value = { for k, v in iosxe_vlan.this : k => v.vlan_id }
}
