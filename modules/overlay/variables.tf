variable "fabric_name" {
  type = string
}

variable "inventory" {
  type = map(any)
}

variable "vrfs" {
  type = list(object({
    name        = string
    vlan_id     = number
    segment_id  = number
    description = string
    attachments = list(object({
      switch_id = string
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
      switch_id    = string
      switch_ports = list(string)
    }))
  }))
}
