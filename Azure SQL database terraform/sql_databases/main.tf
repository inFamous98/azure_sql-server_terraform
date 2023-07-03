resource "azurerm_mssql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "example" {
  for_each            = { for db in var.sql_database_configurations : db.name => db }

  name                = each.value.name
  server_id           = azurerm_mssql_server.example.id
  collation           = each.value.collation
  max_size_gb         = each.value.max_size_gb
  zone_redundant      = each.value.zone_redundant
  read_scale          = each.value.read_scale

  sku_name     = each.value.sku.name
}