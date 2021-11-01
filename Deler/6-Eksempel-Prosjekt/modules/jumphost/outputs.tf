output "vm_ip_addr" {
  #gir oss den offentlige ip-adressen etter deploy.
  value = "offenlig IP-adresse for VM-en er: ${azurerm_linux_virtual_machine.jumphost-vm.public_ip_address}"

}