resource "azurerm_resource_group" "mcit420zz5um" {
  name     = "database-rg"
  location = "West Europe"
}

resource "azurerm_mssql_server" "example" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.mcit420zz5um.name
  location                     = azurerm_resource_group.mcit420zz5um.location
  version                      = "12.0"
  administrator_login          = var.db_login
  administrator_login_password = var.db_password
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_account" "storage" {
  count = length(local.storage_account_names)
  
  name                     = local.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location  
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_resource_group" "rg" {
  name     = "storage-rg"
  location = "eastus"
}
