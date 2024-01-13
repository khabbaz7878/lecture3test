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
}
resource "azurerm_resource_group" "example" {
 name     = "example-resources"
 location = "Canada east"
}

resource "azurerm_virtual_network" "example" {
 name                = "example-vnet"
 address_space       = ["10.0.0.0/16"]
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name

 tags = {
    environment = "example"
 }
}
resource "azurerm_resource_group" "azureresourcegroup" {
  name     = "my-resource-group"
  location = "eastus"
}
resource "azurerm_storage_account" "example" {
  for_each = { for sa in var.listofstorageaccount : sa.name => sa }

  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  access_tier              = each.value.access_tier
  enable_cross_tenant_replication = each.value.cross_tenant_replication_enabled
}
