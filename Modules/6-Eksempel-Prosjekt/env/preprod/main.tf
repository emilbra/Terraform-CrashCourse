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
  env    = "preprod"
}

#siden dette er root-module trenger vi å definere her at vi skal ha outputt.
output "vm_ip_address" {
  value = module.jumphost.vm_public_ip
}