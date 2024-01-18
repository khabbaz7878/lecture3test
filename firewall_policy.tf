# Create a Resource Group
resource "azurerm_resource_group" "example" {
 name     = "example-resources"
 location = "West Europe"
}

# Create an App Service Plan
resource "azurerm_service_plan" "example" {
 name                = "example-service-plan"
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name
 sku_name            = "S1"
 os_type             = "Windows"
}

# Define the Windows Web App
resource "azurerm_windows_web_app" "example" {
 name                = "example-web-app"
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name
 service_plan_id     = azurerm_service_plan.example.id

 site_config {
    always_on        = true
    http2_enabled    = true
    pre_warmed_instance_count = 1
 }

 app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "14.17.3"
 }
}

# Define the Firewall Policy
resource "azurerm_firewall" "example" {
 name                = "example-firewall"
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name

 sku_name = "AZFW_VNet"

 ip_configuration {
    name                 = "example-ip-configuration"
    subnet_id            = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
 }

 firewall_policy_id = azurerm_firewall_policy.example.id
}

resource "azurerm_firewall_policy" "example" {
 name                = "example-firewall-policy"
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name

 sku_name = "AZFW_VNet"

 threat_intelligence_mode = "Alert"

 application_rule_collection {
    name     = "Allow-Microsoft"
    priority = 100

    rule {
      name             = "Allow-Microsoft-1"
      type             = "AzureServices"
      FQDN_tags        = ["MicrosoftServices"]
      action           = "Allow"
      priority         = 100
    }
 }

 network_rule_collection {
    name     = "Allow-Time"
    priority = 200

    rule {
      name                 = "Allow-Time-1"
      type                 = "Basic"
      protocols             = ["Udp"]
      source_addresses      = ["*"]
      destination_ports     = ["123"]
      destination_addresses = ["Time.windows.com"]
      action               = "Allow"
      priority             = 100
    }
 }
}

# Create a subnet for the Firewall
resource "azurerm_subnet" "example" {
 name                 = "example-subnet"
 resource_group_name = azurerm_resource_group.example.name
 virtual_network_name = azurerm_virtual_network.example.name
 address_prefixes     = ["10.0.1.0/24"]
}

# Create a public IP for the Firewall
resource "azurerm_public_ip" "example" {
 name                = "example-public-ip"
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name
 allocation_method   = "Static"
}

# Create a virtual network
resource "azurerm_virtual_network" "example" {
 name                = "example-virtual-network"
 location            = azurerm_resource_group.example.location
 resource
}
