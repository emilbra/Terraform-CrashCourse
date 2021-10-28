# Ressurser i Terraform
Terraform handler i stor grad om å deklarere `Resources`som representerer infrastrukturen vi styrer vha Terraform.

For eksempel kan dette være en ressurs-gruppe i Azure, som vil ha følgende kode:

```terraform

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}

```
