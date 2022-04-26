module "overlay" {
  source      = "../modules/overlay"
  ndfc        = var.ndfc
  fabric_name = var.fabric_name
  inventory   = var.inventory
  vrfs        = var.vrfs
  networks    = var.networks
}

