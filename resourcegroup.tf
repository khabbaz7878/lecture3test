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
  resource "aws_instance" "server" {
 count = 4 # create four similar EC2 instances

 instance_type = "t2.micro"
 ami           = "ami-a1b2c3d4"

 tags = {
    Name = "Server ${count.index}"
 }
}
  
