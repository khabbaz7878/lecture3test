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
resource "azurerm_service_plan" "batcha06sp" {
  for_each = {
    for sp in local.linux_app_list :
    "${sp.name}" => sp
  }

  name                = each.value.name
  location            = azurerm_resource_group.azureresourcegroup.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
}
resource "azurerm_linux_web_app" "batcha06webapp" {
  for_each            = azurerm_service_plan.batcha06sp
  name                = each.value.name
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
  location            = azurerm_resource_group.azureresourcegroup.location
  service_plan_id     = each.value.id

  site_config {}
}
