# Funksjoner i Terraform

Dersom man er kjent med programmering fra før av, så vil konseptet med funksjoner være ganske likt, men det er nyttig å tenke at funksjoner har til hensikt å gjøre noe med verdier eller data, slik at vi kan bruke dette videre i terraform-koden.

For eksempel kan vi iblant ønske å generere et unikt navn til en VM, eller kanskje så ønsker vi å genere et tilfeldig passord ved opprettelse av denne VM-en.

Eksmepel på begge caser:

```Terraform
Add me later alligator
```

Vi kan ikke bygge egne funksjoner i Terraform, men de innebygde funksjonene er ganske robuste, og det er et godt utvalg av de.

Dersom vi absolutt må benytte egne funksjoner er det nyttig å gjøre dette utenfor terraform-koden, for eksempel ved at vi generer verdier, som først blir introdusert til Terraform gjennom variablene når vi deployerer.

Ofte er det nyttig å teste at de gitte funksjonene gjør det vi forventer, for dette kan følgende kommando brukes:

```Bash
terraform console
```

Dette vil opprette et interaktivt konsoll som man teste ulike funksjoner i, uten at det påvirker konfigurasjonen.

Her er et eksempel på at vi benytter funksjonen timestamp() til å gi oss en tag med nøyaktig dato på VM-en vi oppretter. (ikke tenk på at dette kan ses andre steder i Azure)