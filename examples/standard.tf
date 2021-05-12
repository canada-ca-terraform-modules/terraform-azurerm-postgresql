resource "azurerm_key_vault" "keyvault" {
  name                        = "keyvaultname"
  location                    = var.location
  resource_group_name         = var.rg
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true
  soft_delete_enabled         = true

  sku_name = "standard"

  access_policy {
    tenant_id = module.psqlserver.identity_tenant_id
    object_id = module.psqlserver.identity_object_id

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
    tenant_id = var.tenant_id
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
  tags = {}
}

module "psqlserver" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-azurerm-postgresql.git?ref=v1.0.0"

  name           = "psqlservername"
  database_names = ["database"]

  dependencies = []

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  sku_name       = "GP_Gen5_4"
  pgsql_version  = "11"
  storagesize_mb = 512000

  location       = var.location
  resource_group = var.resource_group
  subnet_id      = var.subnet_id
  firewall_rules = []

  active_directory_administrator_object_id = var.active_directory_administrator_object_id
  active_directory_administrator_tenant_id = var.active_directory_administrator_tenant_id

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  key_vault_id = azurerm_key_vault.keyvault.id

  kv_name                                = var.kv_name
  kv_rg                                  = var.kv_rg
  storageaccountinfo_resource_group_name = var.storageaccountinfo_resource_group_name
}
