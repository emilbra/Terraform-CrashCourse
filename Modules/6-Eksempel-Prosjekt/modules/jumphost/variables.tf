variable "env" {
  type = string
}

variable "image" {
  type = map(any)
  default = {
    offer     = "Canonical"
    publisher = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}