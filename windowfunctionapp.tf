provider "azurerm" {
  features {}
}

resource_group:
  example:
    name: example-resources
    location: West Europe

storage_account:
  example:
    name: windowsfunctionappsa
    resource_group_name: ${resource_group.example.name}
    location: ${resource_group.example.location}
    account_tier: Standard
    account_replication_type: LRS

app_service_plan:
  example:
    name: example-app-service-plan
    resource_group_name: ${resource_group.example.name}
    location: ${resource_group.example.location}
    os_type: Windows
    sku:
      name: Y1
      tier: Standard

windows_function_app:
  example:
    name: example-windows-function-app
    resource_group_name: ${resource_group.example.name}
    location: ${resource_group.example.location}
    storage_account_name: ${storage_account.example.name}
    storage_account_access_key: ${storage_account.example.primary_access_key}
    app_service_plan_id: ${app_service_plan.example.id}
    site_config:
      always_on: true
      runtime: python
      version: 3.9
