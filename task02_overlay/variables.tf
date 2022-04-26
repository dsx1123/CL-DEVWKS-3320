variable "ndfc" {
  type = object({
    username = string
    password = string
    url      = string
    platform = string
  })
}

variable "fabric_name" {
  type = string
}

variable "inventory" {
  type = list(string)
}

variable "vrfs" {
  type = list(object({
    name        = string
    vlan_id     = number
    segment_id  = number
    description = string
    attachments = list(object({
      switch_name = string
    }))
  }))
}

variable "networks" {
  type = list(object({
    name         = string
    vlan_id      = number
    network_id   = number
    vrf_name     = string
    ipv4_gateway = string
    description  = string
    attachments = list(object({
      switch_name  = string
      switch_ports = list(string)
    }))
  }))
}
