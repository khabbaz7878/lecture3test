variable "linux_app_list" {
 description = "List of Linux applications."
 type        = list(object({
    name        = string
    os_type     = string
    sku_name    = string
 }))
}

