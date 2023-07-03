module "sql_databases" {
  source = "./sql_databases"

  resource_group_name          = var.resource_group_name
  location                     = var.location
  sql_server_name              = var.sql_server_name
  server_version               = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  sql_database_configurations  = var.sql_database_configurations
}