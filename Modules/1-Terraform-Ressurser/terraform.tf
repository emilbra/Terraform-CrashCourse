terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "my-cool-rg" {
  name     = "example"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.my-cool-rg.name
  location            = azurerm_resource_group.my-cool-rg.location
  allocation_method   = "Static"
}