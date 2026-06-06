variable "host" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "vlans" {
  description = "Map of VLAN name => id to create"
  type        = map(number)
  default = {
    USERS   = 741
    SERVERS = 742
  }
  validation {
    condition     = alltrue([for id in values(var.vlans) : id >= 2 && id <= 4094])
    error_message = "VLAN IDs must be between 2 and 4094."
  }
}
