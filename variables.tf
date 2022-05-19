variable "ndfc" {
  type = object({
    url      = string
    platform = string
  })
}

variable "nd_username" {
  type      = string
  sensitive = true
}

variable "nd_password" {
  type      = string
  sensitive = true
}

variable "fabric_name" {
  type = string
}

variable "inventory" {
  type = map(any)
}

variable "loopbacks" {
  type = list(object({
    switch_id     = string
    loopback_id   = number
    loopback_ipv4 = string
    vrf           = string
    route_tag     = number
  }))
}

variable "vpcs" {
  type = list(object({
    vpc_id          = number
    switch1_id      = string
    switch2_id      = string
    mode            = string
    bpdu_guard_flag = string
    mtu             = string
    peer1_members   = list(string)
    peer2_members   = list(string)
  }))
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
