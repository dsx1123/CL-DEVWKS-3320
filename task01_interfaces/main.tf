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

module "interfaces" {
  source      = "../modules/interface"
  fabric_name = var.fabric_name
  inventory   = var.inventory
  loopbacks   = var.loopbacks
  vpcs        = var.vpcs
}

