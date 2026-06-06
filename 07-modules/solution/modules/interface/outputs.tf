output "names" {
  value = [for lb in iosxe_interface_loopback.this : lb.name]
}
