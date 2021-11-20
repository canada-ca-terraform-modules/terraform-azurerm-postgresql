# Server

variable "active_directory_administrator_object_id" {
  description = "(Optional) The Active Directory Administrator Object ID."
  default     = ""
}

variable "active_directory_administrator_tenant_id" {
  description = "(Optional) The Active Directory Administrator Tenant ID."
  default     = ""
}

variable "administrator_login" {
  description = "(Required) The Administrator Login for the PostgreSQL Server."
}

variable "administrator_login_password" {
  description = "(Required) The Password associated with the administrator_login for the PostgreSQL Server."
}

variable "databases" {
  type        = map(map(string))
  description = "(Required) The name, collation, and charset of the PostgreSQL database(s). (defaults: charset='UTF8', collation='English_United States.1252')"
}

variable "diagnostics" {
  description = "Diagnostic settings for those resources that support it."
  type = object({
    destination   = string
    eventhub_name = string
    logs          = list(string)
    metrics       = list(string)
  })
  default = null
}

variable "emails" {
  type        = list(string)
  description = "(Required) List of email addresses that should recieve the security reports."
  default     = []
}

variable "ip_rules" {
  type        = list(string)
  description = "(Required) List of public IP or IP ranges in CIDR Format."
}

variable "firewall_rules" {
  type        = list(string)
  description = "(Required) Specifies the Start IP Address associated with this Firewall Rule."
}

variable "key_size" {
  type        = number
  description = "Size of key to create in Key Vault."
  default     = 2048
}

variable "key_type" {
  description = "Type of key to create in the Key Vault."
  default     = "RSA"
}

variable "key_vault_id" {
  description = "(Optional) The Key Vault id for the Customer Managed Key."
  default     = ""
}

variable "kv_create" {
  description = "(Optional) If kv_create is set to `true` then enable creation of new key vault else `false` then point to an existing one."
  default     = false
}

variable "kv_name" {
  description = "(Optional) The name to be used for the Key Vault against the PostgreSQL instance."
  default     = ""
}

variable "kv_rg" {
  description = "(Optional) The resource group to be used for the Key Vault against the PostgreSQL instance."
  default     = ""
}

variable "kv_tenant_id" {
  description = "(Required) The Tenant ID to be used for the Key Vault against the PostgreSQL instance."
}

variable "location" {
  description = "(Optional) Specifies the supported Azure location where the resource exists."
  default     = "canadacentral"
}

variable "name" {
  description = "(Required) The name of the PostgreSQL Server."
}

variable "pgsql_version" {
  description = "(Required) The version of the PostgreSQL Server."
  default     = "9.6"
}

variable "public_network_access_enabled" {
  description = "(Required) Whether or not public network access is allowed for this server."
  default     = false
}

variable "resource_group" {
  description = "(Required) The name of the resource group in which to create the PostgreSQL Server."
}

variable "retention_days" {
  description = "(Optional) Specifies the retention in days for logs for this PostgreSQL Server."
  default     = 90
}

variable "sku_name" {
  description = "(Required) Specifies the SKU Name for this PostgreSQL Server."
  default     = "GP_Gen5_4"
}

variable "ssl_enforcement_enabled" {
  description = "(Required) Specifies if SSL should be enforced on connections."
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  description = "(Required) The mimimun TLS version to support on the server."
  default     = "TLS1_2"
}

variable "storagesize_mb" {
  description = "(Required) Specifies the version of PostgreSQL to use."
  default     = 640000
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) The IDs of the subnet that the PostgreSQL server will be connected to."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    environment : "dev"
  }
}

######################################################################
# kv_pointer_enable (pointers in key vault for secrets state)
# => ``true` then state from key vault is used for creation
# => ``false` then state from terraform is used for creation (default)
######################################################################

variable "kv_pointer_enable" {
  description = "(Optional) Flag kv_pointer_enable can either be `true` (state from key vault), or `false` (state from terraform)."
  default     = false
}

variable "kv_pointer_name" {
  description = "(Optional) The key vault name to be used when kv_pointer_enable is set to `true`."
  default     = null
}

variable "kv_pointer_rg" {
  description = "(Optional) The key vault resource group to be used when kv_pointer_enable is set to `true`."
  default     = null
}

variable "kv_pointer_logging_name" {
  description = "(Optional) The logging name to be looked up in key vault when kv_pointer_enable is set to `true`."
  default     = null
}

variable "kv_pointer_logging_rg" {
  description = "(Optional) The logging resource group name to be used when kv_pointer_enable is set to `true`."
  default     = null
}

variable "kv_pointer_sqladmin_password" {
  description = "(Optional) The sqladmin password to be looked up in key vault when kv_pointer_enable is set to `true`."
  default     = null
}

#########################################################
# vnet_create (used for storage account network rule)
# => ``null` then no vnet created or attached (default)
# => ``true` then enable creation of new vnet
# => ``false` then point to existing vnet
#########################################################

variable "vnet_create" {
  description = "(Optional) Flag vnet_create can either be `null` (default), `true` (create vnet), or `false` (use existing vnet)."
  default     = null
}

variable "vnet_cidr" {
  description = "Virtual Network CIDR."
  type        = string
  default     = "172.15.0.0/16"
}

variable "vnet_name" {
  description = "(Optional) The vnet name to be used when vnet_create is either set to `true` or `false`."
  type        = string
  default     = null
}

variable "vnet_rg" {
  description = "(Optional) The vnet resource group to be used when vnet_create is either set to `true` or `false`."
  default     = null
}

#########################################################
# subnet_create (used for storage account network rule)
# => ``null` then no subnet created or attached (default)
# => ``true` then enable creation of new subnet
# => ``false` then point to existing subnet
#########################################################

variable "subnet_create" {
  description = "(Optional) Flag subnet_create can either be `null` (default), `true` (create vnet), or `false` (use existing vnet)."
  default     = null
}

variable "subnet_address_prefixes" {
  description = "Virtual Network Address Prefixes."
  type        = list(string)
  default     = ["172.15.8.0/22"]
}

variable "subnet_name" {
  description = "(Optional) The subnet name to be used when subnet_create is either set to `true` or `false`."
  type        = string
  default     = null
}

#########################################################
# Parameters
#########################################################

variable "client_min_messages" {
  description = "(Optional) Sets the message levels that are sent to the client."
  default     = "log"
}

variable "debug_print_parse" {
  description = "(Optional) Logs each query's parse tree."
  default     = "off"
}

variable "debug_print_plan" {
  description = "(Optional) Logs each query's execution plan."
  default     = "off"
}

variable "debug_print_rewritten" {
  description = "(Optional) Logs each query's rewritten parse tree."
  default     = "off"
}

variable "log_checkpoints" {
  description = "(Optional) Logs each checkpoint."
  default     = "off"
}

variable "log_connections" {
  description = "(Optional) Logs each successful connection."
  default     = "on"
}

variable "log_disconnections" {
  description = "(Optional) Logs end of a session, including duration."
  default     = "on"
}

variable "log_duration" {
  description = "(Optional) Logs the duration of each completed SQL statement."
  default     = "off"
}

variable "log_error_verbosity" {
  description = "(Optional) Sets the verbosity of logged messages."
  default     = "default"
}

variable "log_line_prefix" {
  description = "(Optional) Sets the printf-style string that is output at the beginning of each log line."
  default     = "%t-%c-"
}

variable "log_lock_waits" {
  description = "(Optional) Logs long lock waits."
  default     = "off"
}

variable "log_min_duration_statement" {
  description = "(Optional) Sets the minimum execution time (in milliseconds) above which statements will be logged. -1 disables logging statement durations."
  default     = "10"
}

variable "log_min_error_statement" {
  description = "(Optional) Causes all statements generating error at or above this level to be logged."
  default     = "error"
}

variable "log_min_messages" {
  description = "(Optional) Sets the message levels that are logged."
  default     = "warning"
}

variable "log_retention_days" {
  description = "(Optional) Sets how many days a log file is saved for."
  default     = "7"
}

variable "log_statement" {
  description = "(Optional) Sets the type of statements logged."
  default     = "ddl"
}

variable "row_security" {
  description = "(Optional) Enable row security."
  default     = "on"
}

variable "checkpoint_warning" {
  description = "(Optional) Enables warnings if checkpoint segments are filled more frequently than this. Unit is s."
  default     = "0"
}

variable "connection_throttling" {
  description = "(Optional) Enables temporary connection throttling per IP for too many invalid password login failures."
  default     = "on"
}

variable "maintenance_work_mem" {
  description = "(Optional) Sets the maximum memory to be used for maintenance operations. Unit is kb."
  default     = "32000"
}

variable "min_wal_size" {
  description = "(Optional) Sets the minimum size to shrink the WAL to. Unt is mb."
  default     = "512"
}

variable "max_wal_size" {
  description = "(Optional) Sets the WAL size that triggers a checkpoint. Unit is mb."
  default     = "512"
}

variable "pg_stat_statements_track_utility" {
  description = "(Optional) Selects whether utility commands are tracked by pg_stat_statements."
  default     = "off"
}

variable "pg_qs_track_utility" {
  description = "(Optional) Selects whether utility commands are tracked by pg_qs."
  default     = "on"
}

variable "pg_qs_query_capture_mode" {
  description = "(Optional) Selects which statements are tracked by pg_qs."
  default     = "top"
}

variable "pgms_wait_sampling_query_capture_mode" {
  description = "(Optional) Selects which statements are tracked by the pgms_wait_sampling extension."
  default     = "all"
}

variable "synchronous_commit" {
  description = "(Optional) Sets the current transaction's synchronization level."
  default     = "on"
}

variable "temp_buffers" {
  description = "(Optional) Sets the maximum number of temporary buffers used by each database session. Unit is 8kb."
  default     = "16384"
}

variable "wal_buffers" {
  description = "(Optional) Sets the number of disk-page buffers in shared memory for WAL. Any change requires restarting the server to take effect. Unit is 8kb."
  default     = "8192"
}

variable "wal_writer_delay" {
  description = "(Optional) Time between WAL flushes performed in the WAL writer. Unit is ms."
  default     = "200"
}

variable "wal_writer_flush_after" {
  description = "(Optional) Amount of WAL written out by WAL writer that triggers a flush. Unit is 8kb."
  default     = "128"
}

variable "work_mem" {
  description = "(Optional) Sets the amount of memory to be used by internal sort operations and hash tables before writing to temporary disk files. Unit is kb."
  default     = "2048000"
}
