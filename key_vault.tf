resource "azurerm_key_vault" "pgsql" {
  count = (var.kv_db_create == true) ? 1 : 0

  name                        = var.kv_db_name
  location                    = var.location
  resource_group_name         = var.kv_db_rg
  enabled_for_disk_encryption = true
  tenant_id                   = var.kv_db_tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true

  sku_name = "standard"

  access_policy {
    tenant_id = azurerm_postgresql_server.pgsql.identity[0].tenant_id
    object_id = azurerm_postgresql_server.pgsql.identity[0].principal_id

    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore",
      "wrapKey",
      "unwrapKey",
    ]

    secret_permissions = []

    storage_permissions = []
  }

  access_policy {
    tenant_id = var.kv_db_tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore",
      "wrapKey",
      "unwrapKey",
    ]

    secret_permissions = []

    storage_permissions = []
  }

  network_acls {
    default_action             = var.vnet_create == null ? "Allow" : "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.vnet_create == null ? [] : [var.vnet_create ? azurerm_subnet.pgsql[0].id : data.azurerm_subnet.pgsql[0].id]
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}
