# HVA ER TERRAFORM?

Terraform er et Infrastructure-as-Code (IaC) verktøy som lar oss bygge, konfigurere, versjonere og deployere infrastruktur enkelt.

## Innhold

## Hvorfor er IaC Nyttig?

Ved å samle Infrastrukturen i kode er vi i bedre stand til å (blant annet) automatisere og versjonere infrastrukturen vår. Det er verdt å nevne her at det ikke kun gjelder infrastruktur slik som Virtuelle Maskiner i Azure, men også "high-level" ressurser slik som SaaS-tjenester (infrastrukten vises ikke til oss) eller NSG-regler i Azure.

Terraform, og IaC generelt, lar seg lett integrere med CI/CD - altså at vi benytter automasjon til å fortløpende teste og deployere vår infrastruktur og endringer på den. Ved at Infrastrukturen videre er sjekket inn i et system for versjonskontroll (git) er det *mye* enklere å holde styr på historikk og hva som er endret mellom hver gang. CI/CD, automasjon, og versjonskontroll tillatter større takt på endringene, og lar oss jobbe mer agilt eller DevOps-rettet.

Faktisk er CI/CD og raske iterasjoner noe som kjennetegnes i de fleste bedrifter som har kommet seg lagt i en såkalt "DevOps-evolusjon", hvor Terraform kan være et nyttig verktøy for å oppnå dette.

Mer om DevOps og DevOps-evolusjon kan leses her:

[State Of DevOps Report 2021](https://puppet.com/resources/report/2021-state-of-devops-report) - Utarbeidet av Puppet, CircleCI med fler.

## Hvorfor Terraform?

Terraform generelt er lett anvendelig og har en relativt lettlest syntaks. En terraform-fil er avhengig av ganske få beveglige deler. I tillegg gir Terraform oss mulighet til å teste, eller se utfallet av, koden vår før vi setter den til faktisk bruk.

Ved bruk av for eksempel Azure Resource Manager (ARM) templates vil vi ikke ha det samme innblikket i hva koden faktisk gjør, før vi allerede deployerer denne koden til Azure.

Terraform er Cloud-agnostisk, som betyr at Terraform i praksis kan benyttes mot så mange leverandører (Azure, VMware, Alibaba Cloud) som HashiCorp og Terraform-communitiet lager støtte for. Dette er i motsetning til ARM, som kun fungerer for Azure.
Terraform oppnår dette ved hjelp av "Providers", som i bunn og grunn er plugins som lar deg jobbe mot hver enkelt leverandør.
