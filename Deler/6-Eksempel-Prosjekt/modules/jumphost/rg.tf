resource "azurerm_resource_group" "jump-rg" {
  name     = var.rg-name
  location = var.location
}