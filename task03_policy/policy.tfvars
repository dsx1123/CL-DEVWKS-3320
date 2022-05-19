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

templates = [
  {
    name        = "telemetry"
    description = "static telemetry config"
    file        = "./telemetry.tmpl"
  }
]

policies = [
  {
    switch_id     = 101
    template_name = "telemetry"
    description   = "dialout telemetry"
    priority      = 500
    props         = {}
  },
  {
    switch_id     = 102
    template_name = "telemetry"
    description   = "dialout telemetry"
    priority      = 500
    props         = {}
  },
  {
    switch_id     = 201
    template_name = "telemetry"
    description   = "dialout telemetry"
    priority      = 500
    props         = {}
  },
  {
    switch_id     = 101
    template_name = "ntp_server"
    description   = "ntp_server 10.81.254.131"
    priority      = 500
    props = {
      "NTP_SERVER"     = "10.81.254.131"
      "NTP_SERVER_VRF" = "management"
    }
  },
  {
    switch_id     = 102
    template_name = "ntp_server"
    description   = "ntp_server 10.81.254.131"
    priority      = 500
    props = {
      "NTP_SERVER"     = "10.81.254.131"
      "NTP_SERVER_VRF" = "management"
    }
  },
  {
    switch_id     = 201
    template_name = "ntp_server"
    description   = "ntp_server 10.81.254.131"
    priority      = 500
    props = {
      "NTP_SERVER"     = "10.81.254.131"
      "NTP_SERVER_VRF" = "management"
    }
  }
]
