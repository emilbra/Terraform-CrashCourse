resource "azurerm_network_interface" "jump-nic" {
  name                = "${var.jumphost-name}-nic"
  location            = azurerm_resource_group.jump-rg.location
  resource_group_name = azurerm_resource_group.jump-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.jump-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jump-public-ip.id
  }
  tags = {
    #Denne settes via main.tf
    "Enviroment" = var.env
  }
}
resource "azurerm_public_ip" "jump-public-ip" {
  name                = "${var.jumphost-name}-pubip"
  resource_group_name = azurerm_resource_group.jump-rg.name
  location            = azurerm_resource_group.jump-rg.location
  allocation_method   = "Static"
}

resource "azurerm_linux_virtual_machine" "jumphost-vm" {
  name                = "${var.jumphost-name}-vm"
  resource_group_name = azurerm_resource_group.jump-rg.name
  location            = azurerm_resource_group.jump-rg.location
  size                = var.vm-size
  admin_username      = var.adminuser
  network_interface_ids = [
    azurerm_network_interface.jump-nic.id,
  ]

  admin_ssh_key {
    username = var.adminuser
    # Her så må det eksistere en public key fra før av.
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # kanskje du vil gjøre et forsøk på å parametisere denne?
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  tags = {
    "Environment" = var.env
  }
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.jumphost-vm.public_ip_address
}
