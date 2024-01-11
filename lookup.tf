variable "user_roles" {
 type = map(string)
 default = {
 }
}

variable "default_role" {
 type = string
 default = "guest"
}

locals {
 alice_role = lookup(var.user_roles, "alice", var.default_role)
 bob_role   = lookup(var.user_roles, "bob", var.default_role)
 charlie_role = lookup(var.user_roles, "charlie", var.default_role)
 david_role = lookup(var.user_roles, "david", var.default_role)

 user_role_lookup = {
    alice = local.alice_role
    bob   = local.bob_role
    charlie = local.charlie_role
    david = local.david_role
 }
}

output "user_roles_result" {
 value = local.user_role_lookup
}
