variable "image" {
  type = list(object({
      offer = string
      publisher = string
      sku = string
      version = string
  }))
  default = [ {
    offer = "Canonical"
    publisher = "UbuntuServer"
    sku = "16.04-lts"
    version = "latest"
  } ]
}