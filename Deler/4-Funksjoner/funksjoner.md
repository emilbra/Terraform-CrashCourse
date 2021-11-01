# Funksjoner i Terraform

Dersom man er kjent med programmering fra før av, så vil konseptet med funksjoner være ganske likt, men det er nyttig å tenke at funksjoner har til hensikt å gjøre noe med verdier eller data, slik at vi kan bruke dette videre i terraform-koden.

For eksempel kan vi iblant ønske å lage et timestamp på ønsket format, eller så kan vi ønske å lese innhold fra en lokal fil for å benytte dette senere i koden.

Eksempel på begge caser:

```Terraform
timestamp = formatdate("DDMMYYYY", timestamp())
```

```Terraform
file("${path.module}/note.txt")
```

Merk at disse funksjonene kan settes i variabler, eller i local variables, som vi har gjort i eksempel-koden for denne delen.

Vi kan ikke bygge egne funksjoner i Terraform, men de innebygde funksjonene er ganske robuste, og det er et godt utvalg av de.

Dersom vi absolutt må benytte egne funksjoner er det nyttig å gjøre dette utenfor terraform-koden, for eksempel ved at vi generer verdier, som først blir introdusert til Terraform gjennom variablene når vi deployerer.

Ofte er det nyttig å teste at de gitte funksjonene gjør det vi forventer, for dette kan følgende kommando brukes:

```Bash
terraform console
```

Dette vil opprette et interaktivt konsoll som man teste ulike funksjoner i, uten at det påvirker konfigurasjonen.

Her er et eksempel på at vi benytter funksjonen timestamp() til å gi oss en tag med nøyaktig dato på VM-en vi oppretter. (ikke tenk på at dette kan ses andre steder i Azure)

```Terraform
locals {
  timestamp = formatdate("DDMMYYYY", timestamp())
  note      = file("${path.module}/note.txt")

}

resource "azurerm_resource_group" "my-cool-rg" {
  name     = "my-cool-rg-with-date"
  location = "West Europe"
  tags = {
    date = local.timestamp
    note = local.note
  }
}
```