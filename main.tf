resource "azurerm_postgresql_server" "pgsql" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  sku_name   = var.sku_name
  version    = var.pgsql_version
  storage_mb = var.storagesize_mb

  backup_retention_days        = 35
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_database" "pgsql" {
  count               = length(var.database_names)
  name                = var.database_names[count.index]
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_configuration" "log_checkpoints" {
  name                = "log_checkpoints"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  value               = "on"
}

resource "azurerm_postgresql_configuration" "log_connections" {
  name                = "log_connections"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  value               = "on"
}

resource "azurerm_postgresql_configuration" "log_disconnections" {
  name                = "log_disconnections"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  value               = "on"
}

resource "azurerm_postgresql_configuration" "log_duration" {
  name                = "log_duration"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  value               = "on"
}

resource "azurerm_postgresql_configuration" "connection_throttling" {
  name                = "connection_throttling"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  value               = "on"
}

resource "azurerm_postgresql_configuration" "log_retention_days" {
  name                = "log_retention_days"
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  value               = "7"
}

resource "azurerm_postgresql_virtual_network_rule" "pgsql" {
  name                = azurerm_postgresql_server.pgsql.name
  resource_group_name = var.resource_group
  server_name         = azurerm_postgresql_server.pgsql.name
  subnet_id           = var.subnet_id
}
