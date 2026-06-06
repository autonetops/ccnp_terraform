variable "process_id" {
  type = number
}

variable "router_id" {
  type = string
}

variable "networks" {
  description = "List of OSPF network statements"
  type = list(object({
    ip       = string
    wildcard = string
    area     = string
  }))
}
