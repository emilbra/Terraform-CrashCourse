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