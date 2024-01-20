provider "azurerm" {
  features = {}
}
 
locals {
  function_app_config = yamldecode(file("${path.module}/config.yaml"))["windowsfunctionapp"][0]
}
 
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location =  "Canada East"
}
 
resource "azurerm_storage_account" "example" {
  name                     = "windowsfunctionappsa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = local.function_app_config["account_tier"]
  account_replication_type = local.function_app_config["account_replication_type"]
}
 
resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = local.function_app_config["os_type"]
  sku_name            = local.function_app_config["sku_name"]
}
 
resource "azurerm_windows_function_app" "example" {
  name                = local.function_app_config["name"]
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
 
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id
 
  site_config {}
}
