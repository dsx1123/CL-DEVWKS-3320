terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.2"
    }
  }
}

data "dcnm_inventory" "inventory" {
  for_each    = var.inventory
  fabric_name = var.fabric_name
  switch_name = each.value
}

resource "dcnm_vrf" "vrfs" {
  for_each = {
    for v in var.vrfs : "${v.name}" => v
  }
  fabric_name = var.fabric_name
  name        = each.value.name
  vlan_id     = each.value.vlan_id
  segment_id  = each.value.segment_id
  description = each.value.description
  deploy      = true
  dynamic "attachments" {
    for_each = each.value.attachments
    content {
      serial_number = data.dcnm_inventory.inventory[attachments.value.switch_id].serial_number
      attach        = true
    }
  }
}

resource "dcnm_network" "networks" {
  for_each = {
    for n in var.networks : "${n.name}" => n
  }
  fabric_name  = var.fabric_name
  name         = each.value.name
  network_id   = each.value.network_id
  vlan_id      = each.value.vlan_id
  description  = each.value.description
  vrf_name     = dcnm_vrf.vrfs[each.value.vrf_name].name
  ipv4_gateway = each.value.ipv4_gateway
  deploy       = true

  dynamic "attachments" {
    for_each = each.value.attachments
    content {
      serial_number = data.dcnm_inventory.inventory[attachments.value.switch_id].serial_number
      switch_ports  = attachments.value.switch_ports
      attach        = true
    }
  }
}
