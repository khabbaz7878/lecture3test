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
 alphabets = ["a", "b", "c", "d", "e"]
 numbers   = [1, 2, 3, 4, 5]
 map_of_alpha-letter = {
    for index, letter in local.alphabets:
      letter -> local.numbers[index]
 }
}

