# Variabler i Terraform

Tidligere snakket vi om ressurs-blokken i Terraform, nå skal vi se på ulike blocks som håndterer variabler i Terraform. Dette gjelder da:

1. Input Variables
2. Output Variables
3. Local Values

## Input variables

Input variables fungerer som parametre for Terraform-koden, så brukere/administratorer kan egendfinere utfallet uten å redigere selve kilde-koden til Terraform prosjektet.

For eksempel kan dette benyttes til å definere location som ressursene skal opprettes i. Dersom vi har benyttet variabler til å definere location-argumentet til en eller flere ressurser kan vi endre dette enkelt ett sted, for at det skal bli gjeldende overalt.

```Terraform
Eksempelkode
```

## Output Variables

Dette er variabler som fungerer som returnerte variabler som følge av terraform-kode.

Ett eksmepl kan være å outputte en offenlig ip-adresse etter at den er opprettet. (For Azure får vi vanligvis tildelt en tilfeldig ip-adresse, så vi vet ikke dette før ressursen er opprettet.)

```Terraform
Eksempelkode
```

## Local values

Forenkler bruken av uttrykk som brukes flere ganger innen en modul eller Terraform-fil.

Local values benyttes for å gi et lokalt navn for uttrykk, lik local names for ressurser. 

Det er greit å nevne at uttrykket i en local value ikke er begrenset til å kun sette direkte verdier, men kan også henvise til andre verdier for å omgjøre disse, for eksmepl ved bruk av en funksjon.

```Terraform
Eksempelkode
```

## Henvsining til Variabler

var.rg-name

## Utsetting av variabler til egne filer

Man kan for all del definere variabel-blockene i samme fil som ressurs-blockene i terraform-prosjektet, og for relativt små prosjekt er dette ganske greit.

For større prosjekt er det derimot best practice å skille variablene ut i egne filer, slik at koden er mer lesbar og vi kan, som sagt supplye en ny variabel-fil istedet for å endre kildekoden vi jobber mot.

For dette formålet er det vanlig å opprette to filer:

`terraform.tfvars` og `variables.tf` navnet på disse er likegyldig, men husk at .tfvars må ha riktig filending.

`variables.tf` har egentlig samme oppførsel som en hvilken som helst annen terraform, men vi velger å definere samtlige variabler i denne filen i stedet for i samme fil som ressursene.

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

Eller

- Utsette deklarasjonen til en egen .tfvars-fil

<!-- Verifiser dette også...
 -->
.tfvars-filen er vanlig å inkludere i en .gitignore, siden dette ikke vanligvis er hensiktmessig, nyttig eller bestandig lurt å laste opp til kildekontroll.

