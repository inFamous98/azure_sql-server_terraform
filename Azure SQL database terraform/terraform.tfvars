resource_group_name          = "your-resource-group"
location                     = "eastus"
sql_server_name              = "your-sql-server"
server_version               = "12.0"
administrator_login          = "your-admin-login"
administrator_login_password = "your-admin-password"

sql_database_configurations = [
  {
    name                        = "database1"
    collation                   = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb                 = 10
    zone_redundant              = false
    read_scale                  = false
    sku = {
      name                      = "GP_S_Gen5_1"
      tier                      = "your-sku-tier"
      capacity                  = 1
    }
    import = {
      storage_uri               = "your-storage-uri"
      storage_key               = "default-key"
      storage_key_type          = "SharedAccessKey"
      administrator_login       = "your-administrator-login"
      administrator_login_password = "your-administrator-login-password"
      authentication_type       = "Sql"
    }
    long_term_retention_policy = {
      weekly_retention          = "P7D"
      monthly_retention         = "P30D"
      yearly_retention          = "P365D"
    }
    short_term_retention_policy = {
      retention_days            = "P7D"
      backup_interval_in_hours  = "PT12H"
    }
    threat_detection_policy = {
      state                     = "Enabled"
      disabled_alerts           = []
      email_account_admins      = "Disabled"
      email_addresses           = []
      retention_days            = "P30D"
      storage_account_access_key = "your-storage-account-access-key"
      storage_endpoint          = "your-storage-endpoint"
    }
  }
]
