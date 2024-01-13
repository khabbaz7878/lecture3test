#locals

locals {
 
  service_name = "forum"
  owner = "Community Team"
  lengthofservice_name=length(local.service_name)
favoritclublist=["RealMadrid","Alhilal","ACMILAN"]

}
locals{
  servicename="abracadabra"
  forum="abracadabramcit"
  lengthsa=length(local.servicename)
  lengthforum=length(local.forum)
  winterlistOfSports=["icehockey","snowboarding","iceskating"]
  total_output = ["150", "150", "150"]
}


locals {
 local_flattened_list = flatten(var.nested_list)
}

locals {
 flattened_map = flatten([for k, v in var.nested_map : [for kk, vv in v: {group=k, key = kk, value = vv }]])
}



locals {
 my_value = lookup(var.my_map, "key1", "")
}


