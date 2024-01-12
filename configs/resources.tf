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
