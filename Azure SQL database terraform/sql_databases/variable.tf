variable "resource_group_name" {
  type    = string
  default = "my-resource-group"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "administrator_login" {
  type    = string
  default = "admin_username"
}

variable "sql_server_name" {
  type    = string
  default = "my-sql-server"
}

variable "edition" {
    type = string
    default = "Standard"
}

variable "administrator_login_password" {
  type    = string
  default = "admin_password"
}

variable "server_version" {
  type    = string
  default = "12.0"  # Replace with the appropriate version (e.g., "2.0" or "7.0")
}
variable "sql_database_configurations" {
  type = list(object({
    name                = string
    collation           = string
    max_size_gb         = number
    zone_redundant      = bool
    read_scale          = bool
    sku = object({
      name     = string
      tier     = string
      capacity = number
    })
  }))
}

