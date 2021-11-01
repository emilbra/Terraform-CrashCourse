terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

module "jumphost" {
  #hvor finner vi modulen?
  source = "../../modules/jumphost"
  env    = var.env
  location = var.location
  jumphost-name = var.jumphost-name
  rg-name = var.rg-name
  vm-size = var.vm-size
  adminuser = var.adminuser
}

#siden dette er root-module trenger vi å definere her at vi skal ha outputt.
output "vm_ip_address" {
  value = module.jumphost.vm_public_ip
}