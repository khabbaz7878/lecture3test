output "print"{
value = local.service_name

}
output "lengthowner"{
value=local.owner
}
output "lengthforum"{
value=local.lengthofservice_name
}
output "counNumber"{
value=var.countNumber
}
output "favoritclublist"{
    value=[for sport in local.favoritclublist:sport]
}

output "Canadianfoods" {
  value = [for food in var.Canadianfoods : food]
}

output "USfood" {
  value = [for food in var.USfood : food]
}
output "number_list" {
  value = var.number_list
}
output "sum" {
  value = var.num1 + var.num2 + var.num3
}
output "example_map_output" {
 value = var.example_map
}
output "lightsaber_color_map" {
 value = var.lightsaber_color_map
}

output "starwars" {
value ={
for index, character in toset(local.characters):
character => local.enemies_destroyed[index]
}
/*
for 1st element in -->inside the list variable winterlistOfSports--->"icehockey"1st element
for 2nd element in -->inside the list variable winterlistOfSports--->"snowboarding" 2nd element
for 3rd element in -->inside the list variable winterlistOfSports--->"iceskating" 3rd element
*/
