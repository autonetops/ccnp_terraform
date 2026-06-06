output "created_vlans" {
  value = { for k, v in iosxe_vlan.fleet : k => v.vlan_id }
}
