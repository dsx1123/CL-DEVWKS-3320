ndfc = {
  "username" : "admin",
  "password" : "cisco.123",
  "url" : "https://10.0.209.14",
  "platform" : "nd"
}

fabric_name = "fabric-stage"

loopbacks = [
  {
    loopback_id   = 10
    switch_name   = "pod02-stage-leaf1"
    loopback_ipv4 = "100.100.100.1"
    vrf           = "devnet"
    route_tag     = 12345
  },
  {
    loopback_id   = 10
    switch_name   = "pod02-stage-leaf2"
    loopback_ipv4 = "100.100.100.2"
    vrf           = "devnet"
    route_tag     = 12345
  },
]

vpcs = [
  {
    vpc_id          = 10
    switch_name_1   = "pod02-stage-leaf1"
    switch_name_2   = "pod02-stage-leaf2"
    mode            = "active"
    bpdu_guard_flag = "true"
    mtu             = "jumbo"
    peer1_members   = ["eth1/1"]
    peer2_members   = ["eth1/1"]
  },
  {
    vpc_id          = 20
    switch_name_1   = "pod02-stage-leaf1"
    switch_name_2   = "pod02-stage-leaf2"
    mode            = "active"
    bpdu_guard_flag = "true"
    mtu             = "jumbo"
    peer1_members   = ["eth1/2"]
    peer2_members   = ["eth1/2"]
  },
]

