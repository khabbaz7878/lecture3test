resource "azurerm_windows_web_app" "example" {
 name                = "example-web-app"
 location            = "West US 2"
 resource_group_name = azurerm_resource_group.example.name
 service_plan_id     = azurerm_service_plan.example.id

 site_config {
    always_on        = true
    application_stack {
      current_stack = "Windows"
      dotnet_framework_version = "v4.0"
    }
 }

 app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.14"
 }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}
