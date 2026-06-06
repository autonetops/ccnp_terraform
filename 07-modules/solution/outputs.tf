output "vlan_ids" {
  value = module.vlans.ids
}

output "ospf_process" {
  value = module.ospf.process_id
}

output "acl_name" {
  value = module.acl.name
}
