
variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}
variable "db_login"{
  type=string
}
variable "db_password"{
  type=string
}
variable "countNumber"{
type=number
default=0
}
variable "account_tier"{
  type=string
  default="Standard"
}
variable "myname"{
  type=string
}
variable "account_replication_type"{
  type=string
  default="GRS"
}
variable "access_tier"{
  type=string
  default="Cool"
}
variable "cross_tenant_replication_enabled"{
 type=bool
 default=false
}
variable "environment"{
 type=string
 default="staging"
}
variable "example_list" {
  type    = list(string)
  default = ["item1", "item2", "item3"]
}
variable "Canadianfoods" {
  type = list(string)
  default = ["Poutine", "LobsterRolls", "bagles", "SmokedMeat"]
}
variable "USfood"{
type = list(string)
default = ["Burger","ApplePie","ClamChowder","BBQRibs"]
}
variable "number_list" {
  type = list(number)
  default = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
}
variable "num1" {
  type = number
  default = 10
}

variable "num2" {
  type = number
  default = 20
}

variable "num3" {
  type = number
  default = 30
}
