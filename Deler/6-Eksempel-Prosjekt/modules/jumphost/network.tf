resource "azurerm_virtual_network" "jump-vnet" {
  name                = "${var.jumphost-name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.jump-rg.location
  resource_group_name = azurerm_resource_group.jump-rg.name
}

resource "azurerm_subnet" "jump-subnet" {
  name                 = "${azurerm_virtual_network.jump-vnet.name}-internal-subnet"
  resource_group_name  = azurerm_resource_group.jump-rg.name
  virtual_network_name = azurerm_virtual_network.jump-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}