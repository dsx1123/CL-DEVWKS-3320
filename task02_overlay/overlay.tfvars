ndfc = {
  "username" : "admin",
  "password" : "cisco.123",
  "url" : "https://10.0.209.14",
  "platform" : "nd"
}

fabric_name = "fabric-stage"

inventory = [
  "pod02-stage-leaf1",
  "pod02-stage-leaf2",
  "pod02-stage-spine1",
]

vrfs = [
  {
    name        = "vrf_devnet"
    segment_id  = 150001
    vlan_id     = 2000
    description = "VRF for DEVWKS-3320"
    attachments = [
      {
        switch_name = "pod02-stage-leaf1"
      },
      {
        switch_name = "pod02-stage-leaf2"
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
        switch_name = "pod02-stage-leaf1"
        switch_ports = [
          "Port-channel10",
          "Port-channel20",
        ]
      },
      {
        switch_name = "pod02-stage-leaf2"
        switch_ports = [
          "Port-channel10",
          "Port-channel20",
        ]
      }
    ]
  },
  {
    name         = "network_devnet2"
    network_id   = 130002
    vlan_id      = 2302
    description  = "Network2 for DEVWKS-3320"
    vrf_name     = "vrf_devnet"
    ipv4_gateway = "10.10.11.1/24"
    attachments = [
      {
        switch_name = "pod02-stage-leaf1"
        switch_ports = [
          "Port-channel10",
          "Port-channel20",
        ]
      },
      {
        switch_name = "pod02-stage-leaf2"
        switch_ports = [
          "Port-channel10",
          "Port-channel20",
        ]
      }
    ]
  }
]
