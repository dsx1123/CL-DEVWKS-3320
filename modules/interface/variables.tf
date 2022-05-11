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
