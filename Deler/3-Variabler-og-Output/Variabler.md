# Variabler i Terraform

Tidligere snakket vi om ressurs-blokken i Terraform, nå skal vi se på ulike blocks som håndterer variabler i Terraform. Dette gjelder da:

1. Input Variables
2. Output Variables
3. Local Values

## Input variables

Input variables fungerer som parametre for Terraform-koden, så brukere/administratorer kan egendfinere utfallet uten å redigere selve kilde-koden til Terraform prosjektet.

For eksempel kan dette benyttes til å definere location som ressursene skal opprettes i. Dersom vi har benyttet variabler til å definere location-argumentet til en eller flere ressurser kan vi endre dette enkelt ett sted, for at det skal bli gjeldende overalt.

I variables.tf
```Terraform
variable "location" {
  type    = string
  default = "West Europe"
}
```

I ressursen:
```Terraform
resource "azurerm_resource_group" "my-cool-rg" {
  #variabler henvises til vha var.
  name     = var.rg_name
  location = var.location
}
```

## Output Variables

Dette er variabler som fungerer som returnerte variabler som følge av terraform-kode, og vil vises i som output i CLI som vi kjørte terrafoform fra.

Ett vanlig eksempel kan være å outputte en offenlig ip-adresse etter at den er opprettet. (For Azure får vi vanligvis tildelt en tilfeldig ip-adresse, så vi vet ikke dette før ressursen er opprettet.)

```Terraform
output "ip-output" {
  value = azurerm_public_ip.example.ip_address
}

output "test-output" {
  value = "Du lagde nettop ${azurerm_resource_group.my-cool-rg.name}! er du ikke stolt?"
}
```

## Local values

Forenkler bruken av uttrykk som brukes flere ganger innen en modul eller Terraform-fil.

Local values benyttes for å gi et lokalt navn for uttrykk, lik local names for ressurser. 

Det er greit å nevne at uttrykket i en local value ikke er begrenset til å kun sette direkte verdier, men kan også henvise til andre verdier for å omgjøre disse, for eksmepl ved bruk av en funksjon. Eksemplet under viser akkurat dette, men funksjoner er tema for neste del.

```Terraform
locals {
  # mer om denne i neste del, 
  timestamp = formatdate("DDMMYYYY", timestamp())
}

resource "azurerm_resource_group" "my-cool-rg" {
  #variabler henvises til vha var
  name     = var.rg_name
  location = var.location
  tags = {
    "DATO" = local.timestamp
  }
}
```

## Henvsining til Variabler

For vanlige variabler kan vi benytte synktaks lik dette:

```terraform
#variabel satt i variabel-block
var.rg-name

#local variabel satt i locals block
local.timestamp
```

## Utsetting av variabler til egne filer

Man kan for all del definere variabel-blockene i samme fil som ressurs-blockene i terraform-prosjektet, og for relativt små prosjekt er dette ganske greit.

For større prosjekt er det derimot best practice å skille variablene ut i egne filer, slik at koden er mer lesbar og vi kan, som sagt, supplye en ny variabel-fil istedet for å endre kildekoden vi jobber mot.

For dette formålet er det vanlig å opprette to filer:

`terraform.tfvars` og `variables.tf`. Dersom .tfvars filen heter nøyaktig `terraform.tfvars` eller har ending `auto.tfvars` så vil denne lastets inn automatisk dersom den er tilgjengelig i mappen du deployerer terraform fra. Dersom den heter noe annet, vil du måtte angi denne vha flagget -var-file="testing.tfvars" istedet.

`variables.tf` har egentlig samme oppførsel som en hvilken som helst annen terraform-fil, men vi velger å definere samtlige variabler i denne filen i stedet for i samme fil som ressursene. For deretter å henvise til variablene i andre terraform-filer, feks `var.rg-name`

en variables-fil kan se slik ut:

```Terraform
variable "location" {
    type = string
    default = "West Europe"
}

#for øyeblikket priset på 66 kr i mnd.
variable "size" {
    type = string
    default = "Standard_B1s"
}

variable "rg_name" {
}
```
<!-- Hvordan kan jeg gjøre dette enda tydligere? i stedet for italics?
 -->
Merk at vi i eksemplet over *ikke har definert noen faktiske verdier for variablene*, selv om vi kan angi en default - det er denne som vil benyttes om ikke annet er angitt.

<!-- Verifiser dette, Emil -->

For å gi verdier til disse variablene kan man enten:

- Gjøres gjennom kommandolinjen ved kjøring 

```Bash
terraform apply -var="env=test_environment"
```

Eller

- Utsette deklarasjonen til en egen .tfvars-fil

<!-- Verifiser dette også...
 -->
.tfvars-filen er vanlig å inkludere i en .gitignore, siden dette ikke vanligvis er hensiktmessig, nyttig eller bestandig lurt å laste opp til kildekontroll. Dette fordi en .tvars fil kan inneholde sensitive verdier slik som et passord eller en sensitiv ip-adresse.

Eksempel på en terraform.tfvars fil:

```Terraform
location = "West US"
size     = "Standard_B1s"
rg_name  = "test-rg"
```

Og *voila*, her har vi definert variablene.