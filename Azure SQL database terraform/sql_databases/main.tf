resource "azurerm_mssql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "example" {
  for_each      = { for db in var.sql_database_configurations : db.name => db }
  name          = each.value.name
  server_id     = azurerm_mssql_server.example.id
  collation     = each.value.collation
  max_size_gb   = each.value.max_size_gb
  zone_redundant = each.value.zone_redundant
  read_scale    = each.value.read_scale

  sku_name = each.value.sku.name

  dynamic "import" {
    for_each = each.value.import != null ? [each.value.import] : []

    content {
      storage_uri               = import.value.storage_uri
      storage_key               = import.value.storage_key
      storage_key_type          = import.value.storage_key_type
      administrator_login       = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type       = import.value.authentication_type
    }
  }

  dynamic "threat_detection_policy" {
    for_each = each.value.threat_detection_policy != null ? [each.value.threat_detection_policy] : []

    content {
      state                      = threat_detection_policy.value.state
      disabled_alerts            = threat_detection_policy.value.disabled_alerts
      email_account_admins       = threat_detection_policy.value.email_account_admins
      email_addresses            = threat_detection_policy.value.email_addresses
      storage_account_access_key = threat_detection_policy.value.storage_account_access_key
      storage_endpoint           = threat_detection_policy.value.storage_endpoint
    }
  }
}
