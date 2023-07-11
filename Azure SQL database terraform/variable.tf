variable "resource_group_name" {
  type    = string
  default = "your-resource-group-name"
}

variable "location" {
  type    = string
  default = "your-location"
}

variable "sql_server_name" {
  type    = string
  default = "your-sql-server-name"
}

variable "server_version" {
  type    = string
  default = "your-server-version"
}

variable "administrator_login" {
  type    = string
  default = "your-administrator-login"
}

variable "administrator_login_password" {
  type    = string
  default = "your-administrator-login-password"
}

variable "sql_database_configurations" {
  type = list(object({
    name                        = string
    collation                   = string
    max_size_gb                 = number
    zone_redundant              = bool
    read_scale                  = bool
    sku                         = object({
      name                      = string
      tier                      = string
      capacity                  = number
    })
    import                      = object({
      storage_uri               = string
      storage_key               = string
      storage_key_type          = string
      administrator_login       = string
      administrator_login_password = string
      authentication_type       = string
    })
    threat_detection_policy     = object({
      state                     = string
      disabled_alerts           = list(string)
      email_account_admins      = string
      email_addresses           = list(string)
      storage_account_access_key = string
      storage_endpoint          = string
    })
  }))

  default = [
    {
      name                        = "your-database-name"
      collation                   = "your-collation"
      max_size_gb                 = 10
      zone_redundant              = false
      read_scale                  = false
      sku = {
        name                      = "your-sku-name"
        tier                      = "your-sku-tier"
        capacity                  = 1
      }
      import = {
        storage_uri               = "your-storage-uri"
        storage_key               = "default-key"
        storage_key_type          = "your-storage-key-type"
        administrator_login       = "your-administrator-login"
        administrator_login_password = "your-administrator-login-password"
        authentication_type       = "your-authentication-type"
      }
      threat_detection_policy = {
        state                     = "Enabled"
        disabled_alerts           = []
        email_account_admins      = "Disabled"
        email_addresses           = []
        storage_account_access_key = "your-storage-account-access-key"
        storage_endpoint          = "your-storage-endpoint"
      }
    }
  ]
}
