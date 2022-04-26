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

variable "loopbacks" {
  type = list(object({
    switch_name   = string
    loopback_id   = number
    loopback_ipv4 = string
    vrf           = string
    route_tag     = number
  }))
}

variable "vpcs" {
  type = list(object({
    vpc_id          = number
    switch_name_1   = string
    switch_name_2   = string
    mode            = string
    bpdu_guard_flag = string
    mtu             = string
    peer1_members   = list(string)
    peer2_members   = list(string)
  }))
}
