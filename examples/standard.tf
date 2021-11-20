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

  sku_name       = "GP_Gen5_4"
  pgsql_version  = "11"
  storagesize_mb = 512000

  location       = "canadacentral"
  resource_group = "psql-dev-rg"
  subnet_ids     = []

  ip_rules       = []
  firewall_rules = []

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

  #########################################################
  # kv_create
  # => `true` then enable creation of new key vault
  # => `false` then point to existing key vault
  #########################################################
  kv_create       = true
  kv_tenant_id = "XX-XXXX-XXXX-XXX-XXX"
  kv_name      = "psql-keyvault"
  kv_rg        = "XX-XXXX-XXXX-XXX-XXX"

  ######################################################################
# kv_pointer_enable (pointers in key vault for secrets state)
  # => ``true` then state from key vault is used for creation
  # => ``false` then state from terraform is used for creation (default)
  ######################################################################
  # kv_pointer_enable = false
  # kv_pointer_name              = "kvpointername"
  # kv_pointer_rg                = "kvpointerrg"
  # kv_pointer_logging_name      = "saloggingname"
  # kv_pointer_logging_rg        = "saloggingrg"
  # kv_pointer_sqladmin_password = "sqlhstsvc"

  #########################################################
  # vnet_create (used for storage account network rule)
  # => ``null` then no vnet created or attached (default)
  # => ``true` then enable creation of new vnet
  # => ``false` then point to existing vnet
  #########################################################
  # vnet_create = false
  # vnet_cidr   = "172.15.0.0/16"
  # vnet_name   = "psql-vnet"
  # vnet_rg     = "XX-XXXX-XXXX-XXX-XXX"

  #########################################################
  # subnet_create (used for storage account network rule)
  # => ``null` then no subnet created or attached (default)
  # => ``true` then enable creation of new subnet
  # => ``false` then point to existing subnet
  #########################################################
  # subnet_create = false
  # subnet_name   = "psql-subnet"
  # subnet_address_prefixes = ["172.15.8.0/22"]
}
