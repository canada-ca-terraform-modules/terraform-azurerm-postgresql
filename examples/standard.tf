provider "azurerm" {
  features {}
}

module "postgresql_example" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-azurerm-postgresql.git?ref=v3.0.0"

  name = "psqlservername"
  databases = {
    psqlservername1 = { collation = "English_United States.1252" },
    psqlservername2 = { chartset = "UTF8" },
    psqlservername3 = { chartset = "UTF8", collation = "English_United States.1252" },
    psqlservername4 = {}
  }

  administrator_login          = "psqladmin"
  administrator_login_password = "psql1313"

  # active_directory_administrator_object_id = "XX-XXXX-XXXX-XXX-XXX"
  # active_directory_administrator_tenant_id = "XX-XXXX-XXXX-XXX-XXX"

  #########################################################
  # kv_create
  # => `true` then enable creation of new key vault
  # => `false` then point to existing key vault
  #########################################################
  kv_create       = true
  kv_tenant_id = "XX-XXXX-XXXX-XXX-XXX"
  kv_name      = "psql-keyvault"
  kv_rg        = "XX-XXXX-XXXX-XXX-XXX"

  #########################################################
  # kv_workflow_enable
  # => ``true` then enable storing pointers to secrets in key vault
  # => ``false` then store as default
  #########################################################
  kv_workflow_enable = false
  # kv_workflow_name             = "XXXXX"
  # kv_workflow_rg               = "XX-XXXX-XXXX-XXX-XXX"
  # kv_workflow_salogging_rg     = "XX-XXXX-XXXX-XXX-XXX"

  sku_name       = "GP_Gen5_4"
  pgsql_version  = "11"
  storagesize_mb = 512000

  location       = "canadacentral"
  resource_group = "psql-dev-rg"
  subnet_ids     = []

  ip_rules       = []
  firewall_rules = []

  #########################################################
  # vnet_create
  # => ``true` then enable creation of new vnet
  # => ``false` then point to existing vnet
  #########################################################
  vnet_create = false
  # vnet_cidr   = "172.15.0.0/16"
  vnet_name   = "psql-vnet"
  vnet_rg     = "XX-XXXX-XXXX-XXX-XXX"

  #########################################################
  # subnet_create
  # => ``true` then enable creation of new subnet
  # => ``false` then point to existing subnet
  #########################################################
  subnet_create = false
  subnet_name   = "psql-subnet"
  # subnet_address_prefixes = ["172.15.8.0/22"]

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  # Needs to be disabled until the following issue is resolved: https://github.com/MicrosoftDocs/azure-docs/issues/32068
  # diagnostics = {
  #   destination   = ""
  #   eventhub_name = ""
  #   logs          = ["all"]
  #   metrics       = ["all"]
  # }

  emails = []

  tags = {
    "tier" = "k8s"
  }
}
