#locals

locals {
 
  service_name = "forum"
  owner = "Community Team"
  lengthofservice_name=length(local.service_name)
favoritclublist=["RealMadrid","Alhilal","ACMILAN"]

locals {
  num1 = tonumber(var.numbers[0])
  num2 = tonumber(var.numbers[1]) 
  num3 = tonumber(var.numbers[2])
  
  sum = ([local.num1 + local.num2 + local.num3])
}
