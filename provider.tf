terraform{
  required_providers{
    azurerm={
      source="hashicorp/azurerm"
      version= ">=3.70.0"#this version is for azurerm, NOT terraform version
    }
  }
  required_version=">=1.4.0"#this version is for Terraform Version, NOT azurerm
}

provider "azurerm"{
  features{}
  skip_provider_registration="true"
  
  subscription_id=var.subscription_id
  client_id=var.client_id
  client_secret=var.client_secret
  tenant_id=var.tenant_id
}
provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "server" {
 count = 4

 instance_type = "t2.micro"
 ami           = "ami-a1b2c3d4"

 tags = {
    Name = "Server ${count.index}"
 }
}
