# Ressurser i Terraform

Terraform handler i stor grad om å deklarere `Resources` som representerer infrastrukturen vi styrer vha Terraform.

For eksempel kan dette være en ressurs-gruppe i Azure, som vil ha følgende kode:

```terraform
resource "azurerm_resource_group" "my-cool-rg" {
  name     = "ressursgruppe-1"
  location = "West Europe"
}
```

Argumentene for ulike typer ressurser avhenger fullstendig av den typen ressurs, og deres dokumentasjon vil inneholde en oversikt over hvilke argumenter som er tilgjengelige. Et eksempel på et argument som går igjen er "name", som i dette eksemplet er definert ved hjelp av `name = "ressursgruppe-1"`

## Blocks, labels og arguments

### Blocks

`Blocks` er konteinere for annet innhold i Terraform og benyttes for å representere konfigurasjonen til et objekt.
Det er ulike typer blocks, hvor eksemplet over viser til en `resource`-block. Det er denne typen block vi vil forholde oss mest til.

### Labels

En ressurs-blokk krever to `labels`

```terraform
"azurerm_resource_group" #hvilken ressurs-type vi skal konfigurere, her en ressurs-gruppe
```

og

```terraform
"my-cool-rg" # lokalt navn på ressursen 
```

`"azurerm_resource_group"` benyttes for å deklarere hvilken ressurs-type som defineres i denne ressurs-blokken. En ressurs-gruppe i Azure er bare et eksempel, et annet er `"azurerm_virtual_machine"`

`"my-cool-rg"` er et lokalt navn for ressursen, og benyttes for å henvise til denne ressursen i andre deler av terraform-koden.

### Local name

Det lokale navnet er kun lokalt og har ingen betydning utenfor terraform-konfigurasjonen. Vi kan for eksempel benytte dette til å vise til ressursgruppen i en annen ressurs. Eksempelvis i location-argumentet eller resource_group_name-argumentet hos en annen ressurs

```terraform
  resource "azurerm_public_ip" "my-cool-ip" {
  name                = "PublicIp1"
  resource_group_name = azurerm_resource_group.my-cool-rg.name
  location            = azurerm_resource_group.my-cool-rg.location
  allocation_method   = "Static"
}
```

Her ser vi at ressurs-typen `"azurerm_public_ip"` trenger å ha `resource_group_name` og `location` satt. Dette er argumenter som jo kan hardkodes inn, men vi sparer tid og reduserer feil ved å gjenbruke verdier satt i andre steder av koden eller som en variabel tidligere. 

Det som vill skje her er at location-argumentet på `"my-cool-ip"` henviser til location-argumentet på `"my-cool-rg"` ved hjelp av en identifier, sammensatt av ressurs-type, lokalt navn og argumentet/propertien vi ønsker å hente ut.

| Ressurstype |  ==>  | `azurerm_resource_group`  |
|---|---|---|
| Local name  | ==>   | `my-cool-rg`  |
| property  | ==>   | `location`   |

Blir til `azurerm_resource_group.my-cool-rg.location`

I dette eksemplet blir `azurerm_resource_group.my-cool-rg.location` til  `"West Europe"`
