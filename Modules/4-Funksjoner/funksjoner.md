# Funksjoner i Terraform

Dersom man er kjent med programmering fra før av, så vil konseptet med funksjoner være ganske likt, men det er nyttig å tenke på at funksjoner har til hensikt å gjøre noe med verdier eller data, slik at vi kan benytte det til å gjøre ønsket handling.

For eksempel kan vi iblant ønske å generere et unikt navn til en VM, eller kanskje så ønsker vi å genere et tilfeldig passord ved opprettelse av denne VM-en.

Eksmepel på begge caser:

```Terraform
Add me later alligator
```

Vi kan ikke bygge egne funksjoner i Terraform, den komplette listen kan finnes `her`

Det er iblant nyttig å teste hva de gitte funksjonene gjør, og for det formålet kan man benytte seg av følgende kommando

```Bash
terraform console
```

Dette vil opprette et interaktivt konsoll som man teste ulike funksjoner i, uten at det påvirker konfigurasjonen.