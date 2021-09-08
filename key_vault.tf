locals {
  pgsql_diag = {
    storage_account_id = var.kv_workflow_enable ? data.azurerm_storage_account.saloggingname[0].id : azurerm_storage_account.pgsql[0].id
    metric             = ["all"]
    log                = ["all"]
  }
}

resource "azurerm_key_vault" "pgsql" {
  count = var.kv_db_enable ? 0 : 1

  name                        = var.kv_db_name
  location                    = var.location
  resource_group_name         = var.kv_db_rg
  enabled_for_disk_encryption = true
  tenant_id                   = var.kv_db_tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true
  soft_delete_enabled         = true

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
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = [var.subnet_enable ? azurerm_subnet.pgsql[0].id : data.azurerm_subnet.pgsql[0].id]
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}

data "azurerm_monitor_diagnostic_categories" "pgsql_diag_cat" {
  count = var.kv_db_enable ? 0 : 1

  resource_id = azurerm_key_vault.pgsql[0].id
}

resource "azurerm_monitor_diagnostic_setting" "pgsql_diag_setting" {
  count = var.kv_db_enable ? 0 : 1

  name               = "${var.name}-keyvault-diag"
  target_resource_id = azurerm_key_vault.pgsql[0].id
  storage_account_id = local.pgsql_diag.storage_account_id

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.pgsql_diag_cat[0].logs

    content {
      category = log.value
      enabled  = contains(local.pgsql_diag.log, "all") || contains(local.pgsql_diag.log, log.value)

      retention_policy {
        enabled = true
        days    = 90
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.pgsql_diag_cat[0].metrics

    content {
      category = metric.value
      enabled  = contains(local.pgsql_diag.metric, "all") || contains(local.pgsql_diag.metric, metric.value)

      retention_policy {
        enabled = true
        days    = 90
      }
    }
  }
}
