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
  timestamp = formatdate("DDMMYYYY", timestamp())
  note      = file("${path.module}/note.txt")

}

resource "azurerm_resource_group" "my-cool-rg" {
  name     = "my-cool-rg-with-date"
  location = "West Europe"
  tags = {
    date = local.timestamp
    note = local.note
  }
}
