ndfc = {
  username = "admin",
  password = "cisco.123",
  url      = "https://10.15.0.26",
  platform = "nd"
}

fabric_name = "fabric-stage"

inventory = {
  101 = "staging-leaf1",
  102 = "staging-leaf2",
  201 = "staging-spine1",
}

vrfs = [
  {
    name        = "vrf_devnet"
    segment_id  = 150001
    vlan_id     = 2000
    description = "VRF for DEVWKS-3320"
    attachments = [
      {
        switch_id = 101
      },
      {
        switch_id = 102
      },
    ]
  }
]

networks = [
  {
    name         = "network_devnet1"
    network_id   = 130001
    vlan_id      = 2301
    description  = "Network1 for DEVWKS-3320"
    vrf_name     = "vrf_devnet"
    ipv4_gateway = "10.10.10.1/24"
    attachments = [
      {
        switch_id = 101
        switch_ports = [
          "Port-channel10",
          "Port-channel20",
        ]
      },
      {
        switch_id = 102
        switch_ports = [
          "Port-channel10",
          "Port-channel20",
        ]
      }
    ]
  }
]
