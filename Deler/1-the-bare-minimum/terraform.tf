## Dette er den minste terraform-filen mulig som jeg kan komme på

# Hvilken provider benytter vi? Nødvendig for at Terraform skal hente inn og installere det som er nødvendig for å deployere mot gitt Provider. Her Azure. 

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

#når vi deklarerer en provider som required må vi definere et lokalt navn for provideren, vanligvis er det foretrukket å benytte høyresiden av navnet gitt i source på required_providers.
provider "azurerm" {
  #features benyttes for å egendefinere noe funksjonalitet for provideren
  features {

  }
}

resource "azurerm_resource_group" "my-cool-rg" {
  name     = "example"
  location = "West Europe"
}
