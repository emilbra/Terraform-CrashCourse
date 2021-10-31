output "vm_ip_addr" {
  #gir oss den offentlige ip-adressen etter deploy.
  value = azurerm_linux_virtual_machine.jumphost-vm.public_ip_address

}