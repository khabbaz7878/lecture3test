
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

variable "example_map" {
type = map(object({
 name                 = string
 enemies_destroyed    = number
 badguy               = bool
 }))

 default = {
   key1 = {
     name                = "luke"
     enemies_destroyed   = 4252
      badguy              = false
    }
    key2 = {
      name                = "yoda"
     enemies_destroyed   = 988
      badguy              = false
    }
    key3 = {
      name                = "darth"
      enemies_destroyed   = 282032989844
      badguy              = true
    }
 }
}

variable "lightsaber_color_map" {
 type = map(list(string))
 default = {
    luke = ["green", "blue"]
    yoda = ["green"]
    darth = ["red"]
 }
}

variable "nested_list" {
 type        = list(list(list(string)))
 default     = [
    [["a", "b"], ["c", "d"]],
    [["e", "f"], ["g", "h"]]
 ]
}
variable "nested_map" {
 type = map(map(string))
 default = {
    group1 = {"name" = "Alice", "age" ="25"}
    group2 = {"name" = "Bob", "age" ="30"}
 }
}

variable "my_map" {
 type = map(string)
 default = {
    "key1" = "value1"
 }
}
variable "linux_app_list" {
 description = "List of Linux applications."
 type        = list(object({
    name        = string
    os_type     = string
    sku_name    = string
 }))
}
