module "policy" {
  source      = "../modules/policy"
  ndfc        = var.ndfc
  fabric_name = var.fabric_name
  inventory   = var.inventory
  templates   = var.templates
  policies    = var.policies
}

