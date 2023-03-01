terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.7"
    }
  }
  backend "http" {
  }
}

provider "dcnm" {
  username = var.nd_username
  password = var.nd_password
  url      = var.ndfc.url
  platform = var.ndfc.platform
}

module "interfaces" {
  source      = "./modules/interface"
  inventory   = var.inventory
  fabric_name = var.fabric_name
  loopbacks   = var.loopbacks
  vpcs        = var.vpcs
}

module "overlay" {
  depends_on  = [module.interfaces]
  source      = "./modules/overlay"
  fabric_name = var.fabric_name
  inventory   = var.inventory
  vrfs        = var.vrfs
  networks    = var.networks
}

# bonus

module "policy" {
  source      = "./modules/policy"
  fabric_name = var.fabric_name
  inventory   = var.inventory
  templates   = var.templates
  policies    = var.policies
}
