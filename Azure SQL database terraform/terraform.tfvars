sql_database_configurations = [
  {
    name                = "database-1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb         = 100
    zone_redundant      = true
    read_scale          = false
    sku = {
      name     = "GP_S_Gen5_2"
      tier     = "GeneralPurpose"
      capacity = 2
    }
  },
  {
    name                = "database-2"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb         = 100
    zone_redundant      = true
    read_scale          = false
    sku = {
      name     = "GP_S_Gen5_2"
      tier     = "GeneralPurpose"
      capacity = 2
    }
  }
]

resource_group_name = "POC"
sql_server_name     = "sql-1"
