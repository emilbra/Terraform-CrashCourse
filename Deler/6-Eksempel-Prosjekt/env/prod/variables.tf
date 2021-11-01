variable "env" {
  type = string
}

variable "location" {
  type    = string
  default = "West Europe"
}

#### Navnsetting av ressurser
variable "jumphost-name" {
  type = string
}

variable "rg-name" {
  type    = string
  default = "jump-rg"
}

#### Konfigurasjon av VM
variable "vm-size" {
  type    = string
  default = "Standard_F2"
}

variable "adminuser" {
  type    = string
  default = "adminuser"
}

variable "sa-name" {
  type    = string
  default = "sa123415251"
}
