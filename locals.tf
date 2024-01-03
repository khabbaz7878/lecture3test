#locals

locals {
 
  service_name = "forum"
  owner = "Community Team"
  lengthofservice_name=length(local.service_name)
favoritclublist=["RealMadrid","Alhilal","ACMILAN"]

}
locals {
  storage_account_names = [
    "${var.first_name}mcit${var.last_name}1", 
    "${var.first_name}mcit${var.last_name}2",
    "${var.first_name}mcit${var.last_name}3",
    "${var.first_name}mcit${var.last_name}4",
    "${var.first_name}mcit${var.last_name}5"
  ]
}
