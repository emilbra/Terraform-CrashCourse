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

