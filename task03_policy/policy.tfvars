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

templates = [
  {
    name        = "telemetry"
    description = "static telemetry config"
    file        = "./telemetry.tmpl"
  }
]

policies = [
  {
    switch_name   = "pod02-stage-leaf1"
    template_name = "telemetry"
    description   = "dialout telemetry"
    priority      = 500
    props         = {}
  },
  {
    switch_name   = "pod02-stage-leaf2"
    template_name = "telemetry"
    description   = "dialout telemetry"
    priority      = 500
    props         = {}
  },
  {
    switch_name   = "pod02-stage-spine1"
    template_name = "telemetry"
    description   = "dialout telemetry"
    priority      = 500
    props         = {}
  },
  {
    switch_name   = "pod02-stage-leaf1"
    template_name = "ntp_server"
    description   = "ntp_server 10.81.254.131"
    priority      = 500
    props = {
      "NTP_SERVER"     = "10.81.254.131"
      "NTP_SERVER_VRF" = "management"
    }
  },
  {
    switch_name   = "pod02-stage-leaf2"
    template_name = "ntp_server"
    description   = "ntp_server 10.81.254.131"
    priority      = 500
    props = {
      "NTP_SERVER"     = "10.81.254.131"
      "NTP_SERVER_VRF" = "management"
    }
  },
  {
    switch_name   = "pod02-stage-spine1"
    template_name = "ntp_server"
    description   = "ntp_server 10.81.254.131"
    priority      = 500
    props = {
      "NTP_SERVER"     = "10.81.254.131"
      "NTP_SERVER_VRF" = "management"
    }
  },
]
