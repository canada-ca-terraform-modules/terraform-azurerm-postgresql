provider "azurerm" {
  features {}
}

module "postgresql_example" {
  source = "git::https://github.com/canada-ca-terraform-modules/terraform-azurerm-postgresql.git?ref=v2.2.0"

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

  kv_db_enable    = false
  # kv_db_tenant_id = "XX-XXXX-XXXX-XXX-XXX"
  # kv_db_name    = "XXXXX"
  # kv_db_rg      = "XX-XXXX-XXXX-XXX-XXX"

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

  vnet_cidr   = "172.15.0.0/16"
  vnet_enable = false
  vnet_name   = "psql-vnet"
  vnet_rg     = "XX-XXXX-XXXX-XXX-XXX"

  subnet_enable           = false
  subnet_name             = "psql-subnet"
  subnet_address_prefixes = ["172.15.8.0/22"]

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  diagnostics = {
    destination   = ""
    eventhub_name = ""
    logs          = ["all"]
    metrics       = ["all"]
  }

  emails = []

  tags = {
    "tier" = "k8s"
  }
}
