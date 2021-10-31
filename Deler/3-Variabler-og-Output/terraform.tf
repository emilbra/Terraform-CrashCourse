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

locals {
  # mer om denne i neste del, 
  timestamp = formatdate("DDMMYYYY", timestamp())
}

resource "azurerm_resource_group" "my-cool-rg" {
  #variabler henvises til vha var
  name     = var.rg_name
  location = var.location
  tags = {
    # mer om denne i nest del, viktigst her er at local.-prefiks benyttes på locals
    "DATO" = local.timestamp
  }
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.my-cool-rg.name
  location            = azurerm_resource_group.my-cool-rg.location
  allocation_method   = "Static"
}

output "test-output" {
  value = "Du lagde nettop ${azurerm_resource_group.my-cool-rg.name}! er du ikke stolt?"
}

output "ip-output" {
  value = azurerm_public_ip.example.ip_address
}