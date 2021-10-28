# The bare minimum

På sitt enkleste kan en terraform-fil se slik ut:

```terraform
## Dette er den minste terraform-filen mulig som jeg kan komme på

# Hvilken provider benytter vi? Nødvendig for at Terraform skal hente inn og installere det som er nødvendig for å deployere mot gitt Provider. Her Azure. 

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
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
```

Vi skal etterhvert forklare hva som skjer her, og hva de ulike blokkene med kode er. Først og fremst, hvordan bruker vi denne koden?

## Installere Terraform

[Installere Terraform Dok](https://learn.hashicorp.com/tutorials/terraform/install-cli)

[Autentiser mot Azure vha Azure CLI](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli)

## Nyttige kommandoer

Følgende kommandoer kommer du omtrent ikke utennom ved bruk av terraform:

```bash
terraform init  # Laster inn og klargjør terraform til bruk

terraform plan # skriver ut utfallet av koden uten at det faktisk blir deployert

terraform apply # Deployerer terraform-koden. I bakgrunnen kjører den også terraform-plan, og vi blir bedt om å bekrefte endringene

terraform destroy # tar ned infrastrukturen angitt i terraform-koden.

terraform plan --destroy # Lik terraform plan, men bare at vi ser hva som eventult vil ødelegges før vi kjører terraform destroy.
```

## Vanlig Workflow Terraform

En vanlig workflow når du jobber lokalt med terraform kan være som følger:

0. Installer Terraform og koble til azure, for eksempel ved hjelp av `az login` dersom man benytter Azure CLI
1. Skriv terraform-kode

Stående på samme mappe som terraform koden:

2. Benytt `terraform init` til å klargjøre for deployering terraform
3. Benytt `terraform plan` til å se hvilke endringer terraform-koden vil medføre på infrastrukten.
4. Benytt `terraform apply` til å endre infrastrukturen til å samsvare med terraform-koden.

Thats it!

Prøv selv med `terraform.tf` i samme mappe som dette dokumentet! 
Husk å stå med kommando-linjen på samme sted som `terraform.tf`, samt at terraform er installert og koblet til en konto.