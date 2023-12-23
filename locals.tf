#locals

locals {
 
  service_name = "forum"
  owner = "Community Team"
  lengthofservice_name=length(local.service_name)
favoritclublist=["RealMadrid","Alhilal","ACMILAN"]

  num1 = tonumber(var.num_strings[0])
  num2 = tonumber(var.num_strings[1])
  num3 = tonumber(var.num_strings[2])

  sum = local.num1 + local.num2 + local.num3
}
