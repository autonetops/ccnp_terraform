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
  description = "TODO(exercise): make this map(number) with a validation block (2-4094). Default { USERS = 741, SERVERS = 742 }."
  type        = map(number)
  default     = {}
}
