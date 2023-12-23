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
/*
for 1st element in -->inside the list variable winterlistOfSports--->"icehockey"1st element
for 2nd element in -->inside the list variable winterlistOfSports--->"snowboarding" 2nd element
for 3rd element in -->inside the list variable winterlistOfSports--->"iceskating" 3rd element
*/
