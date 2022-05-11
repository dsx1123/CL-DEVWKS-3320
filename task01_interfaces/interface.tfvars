ndfc = {
  "username" : "admin",
  "password" : "cisco.123",
  "url" : "https://10.15.0.26",
  "platform" : "nd"
}

fabric_name = "fabric-stage"

inventory = {
  "101" : "staging-leaf1",
  "102" : "staging-leaf2",
  "201" : "stanging-spine1",
}

loopbacks = [
  {
    loopback_id   = 10
    switch_id     = 101
    loopback_ipv4 = "100.100.100.1"
    vrf           = "devnet"
    route_tag     = 12345
  },
  {
    loopback_id   = 10
    switch_id     = 102
    loopback_ipv4 = "100.100.100.2"
    vrf           = "devnet"
    route_tag     = 12345
  },
]

vpcs = [
  {
    vpc_id          = 10
    switch1_id      = "101"
    switch2_id      = "102"
    mode            = "active"
    bpdu_guard_flag = "true"
    mtu             = "jumbo"
    peer1_members   = ["eth1/1"]
    peer2_members   = ["eth1/1"]
  },
  {
    vpc_id          = 20
    switch1_id      = "101"
    switch2_id      = "102"
    mode            = "active"
    bpdu_guard_flag = "true"
    mtu             = "jumbo"
    peer1_members   = ["eth1/2"]
    peer2_members   = ["eth1/2"]
  }
]

