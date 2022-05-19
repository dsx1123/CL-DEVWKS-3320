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

resource "dcnm_template" "templates" {
  for_each = {
    for t in var.templates : "${t.name}" => t
  }
  name                  = each.value.name
  content               = file("${each.value.file}")
  description           = each.value.description
  supported_platforms   = ["N9K"]
  template_type         = "POLICY"
  template_sub_type     = "DEVICE"
  template_content_type = "TEMPLATE_CLI"
}

resource "dcnm_policy" "policy" {
  for_each = {
    for index, p in var.policies : index => p
  }
  depends_on            = [dcnm_template.templates]
  serial_number         = data.dcnm_inventory.inventory[each.value.switch_id].serial_number
  template_name         = each.value.template_name
  template_props        = each.value.props
  priority              = each.value.priority
  description           = each.value.description
  entity_name           = "SWITCH"
  entity_type           = "SWITCH"
  template_content_type = "TEMPLATE_CLI"
}
