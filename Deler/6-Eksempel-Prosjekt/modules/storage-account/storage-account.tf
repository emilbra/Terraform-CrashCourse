resource "azurerm_storage_account" "sa" {
  #Her vil jeg etterhvert benytte locals for å lage et unikt navn basert på input - bestandig et problem når man oppretter manuelt er å finne et fullstendig unikt navn..
  name                     = var.sa-name
  resource_group_name      = azurerm_resource_group.sa-rg.name
  location                 = azurerm_resource_group.sa-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.env
  }
}

## Etterhvert ønsker jeg å benytte logiske operatorer for å koble et share til vmen, dersom det eksisterer ett share med korrekte tags.
