terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.2"
    }
  }
  backend "s3" {
    bucket         = "tf-backend-pod06"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
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
