# Moduler i Terraform

Som vi var innom i en tidligere læremodul kan det etterhvert bli vanskelig å holde styr på flere ressurser eller mye konfigurasjon, særlig som del av kun en fil.

Moduler er kontainere som huser flere ressurser som vanligvis benyttes sammen. Disse modulene består da av en eller flere .tf-filer i samme mappe.

Faktisk har vi benyttet en modul allerede, root-modulen.
alle terraform-konfigurasjoner inneholder minst denne, og det har vært .tf-filen vi har definert alle ressurser i tidligere.

I del 3 så var dette `terraform.tf`.

Når vi trenger å ha et mer bevisst forhold til moduler begynner vi å snakke om `Child Modules`. Dette er moduler som vi kaller fra root-modulen, og som vi kan gi variabler gjennom root-modulen.

Modulene kan kalles flere ganger i en konfigurasjon.

Årsaken til at vi benytter moduler er for å forenkle gjennbruk, men også endringer etterhvert. Dersom vi vet at vi trenger å endre på for eksempel modulen som inneholder våre VM-er, så er det kun nødvendig å endre på den enkelte modulen.

Moduler kan også benyttes for å videre abstrahere ressursene vi jobber med, slik at vi kan behandle, definere og deployere infrastrukuturen med tanke på arkitektur, og ikke med tanke på fysiske objekter.

## Hvordan benytte moduler

### Kalling av moduler

I en root-modul kan vi kalle moduler slik, som vist i `main.tf`

```Terraform
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "jumphost" {
    #hvor finner vi modulen?
  source = "../../modules/jumphost"
}
``` 

Det er vanlig å kalle denne root-modulen for `main.tf`, slik at det er lettere å se at dette er hvor modulene kalles fra, men det kan i praksis hete hva som helst. You do you.

### Innholdet i moduler

Det er viktig å tenke på mapper når det gjelder moduler og Terraform generelt. For eksempel slik:

```
.
├── env
│   └── main.tf
└── modules
    └── jumphost
        ├── jumphost-vm.tf
        ├── network.tf
        └── rg.tf

```

Som vi ser av eksemplet over så henviser `main.tf` (i env) til modulen Jumphost med path relativ til seg selv.

Årsaken til at jeg kaller mappen som `main.tf` står i som env her, er fordi det er vanlig å ha ha flere mapper innunder her igjen, slik at vi har separate `main.tf` filer for ulike miljøer. For eksempel en som er dedikert til test-miljøet, en som er dedikert til førproduksjon og en som er dedikert til produksjon.

I et mer reelt eksempel kan derfor strukturen se mer slik ut, og det er denne strukturen vi benytter i denne delen:

```
.
├── env
│   ├── preprod
│   │   └── main.tf
│   ├── prod
│   │   └── main.tf
│   └── test
│       └── main.tf
└── modules
    └── jumphost
        ├── jumpost-vm.tf
        ├── network.tf
        └── rg.tf
```

### Deploy av infrastruktur med moduler.

For å deployere infrastrukur ved bruk av moduler vil vi i praksis deployere likt det vi ville gjort uten modulene, ved at vi står i mappen med `main.tf`, og kjører terraform plan, apply, etc. derfra.

Når det gjelder dette er det greit å tenke at `main.tf` er root-modulen som kaller alle andre moduler, og på samme vis var `terraform.tf`-filen vi benyttet i de tidligere delene også en root-modul. I stedet for å hente resurser fra andre filer, var ressursene derimot definert i en og samme fil.

## Prøv det selv!
