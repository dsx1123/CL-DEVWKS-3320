terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.2"
    }
  }
}

provider "dcnm" {
  username = var.ndfc.username
  password = var.ndfc.password
  url      = var.ndfc.url
  platform = var.ndfc.platform
}

resource "dcnm_interface" "loopbacks" {
  for_each = {
    for lo in var.loopbacks : "${lo.switch_name}|loopback${lo.loopback_id}" => lo
  }
  fabric_name   = var.fabric_name
  type          = "loopback"
  name          = "loopback${each.value.loopback_id}"
  policy        = "int_loopback"
  switch_name_1 = each.value.switch_name
  vrf           = each.value.vrf
  ipv4          = each.value.loopback_ipv4
  loopback_tag  = each.value.route_tag
  deploy        = true
}

resource "dcnm_interface" "vpcs" {
  for_each = {
    for vpc in var.vpcs : "${vpc.switch_name_1}|${vpc.switch_name_2}|vpc${vpc.vpc_id}" => vpc
  }
  fabric_name   = var.fabric_name
  policy        = "int_vpc_trunk_host"
  type          = "vpc"
  name          = "vPC${each.value.vpc_id}"
  switch_name_1 = each.value.switch_name_1

  switch_name_2           = each.value.switch_name_2
  vpc_peer1_id            = each.value.vpc_id
  vpc_peer2_id            = each.value.vpc_id
  mode                    = each.value.mode
  bpdu_guard_flag         = each.value.bpdu_guard_flag
  mtu                     = each.value.mtu
  vpc_peer1_allowed_vlans = "none"
  vpc_peer2_allowed_vlans = "none"
  vpc_peer1_interface     = each.value.peer1_members
  vpc_peer2_interface     = each.value.peer2_members
  deploy                  = true
}
