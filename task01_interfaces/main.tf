module "interfaces" {
  source      = "../modules/interface"
  ndfc        = var.ndfc
  fabric_name = var.fabric_name
  loopbacks   = var.loopbacks
  vpcs        = var.vpcs
}

