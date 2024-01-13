resource "azurerm_windows_web_app" "example" {
 name                = "example-web-app"
 location            = "West US 2"
 resource_group_name = azurerm_resource_group.example.name
 service_plan_id     = azurerm_service_plan.example.id

 site_config {
    always_on        = true
    application_stack {
      current_stack = "dotnet"
     dotnet_version = "2.0"
    }
 }

 app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.14"
 }
}

resource "azurerm_service_plan" "example" {
 name                = "example-service-plan"
 location            = "West US 2"
 resource_group_name = azurerm_resource_group.example.name
 os_type             = "Windows"
 sku_name            = "B1"
}
