variable "host" {
  description = "RESTCONF base URL of the IOS XE device"
  type        = string
}

variable "username" {
  description = "Device username"
  type        = string
}

variable "password" {
  description = "Device password"
  type        = string
  sensitive   = true
}
