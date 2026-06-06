variable "loopbacks" {
  description = "Map of loopback number => { description, ip, mask }"
  type = map(object({
    description = string
    ip          = string
    mask        = string
  }))
}
