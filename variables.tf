# Server

variable "name" {
  description = "The name of the PostgreSQL Server"
}

variable "database_names" {
  type        = list(string)
  description = "The name of the PostgreSQL database(s)"
}

variable "dependencies" {
  type        = "list"
  description = "Dependency management of resources"
}

variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Server"
}

variable "administrator_login_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server"
}

variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server"
  default     = "GP_Gen5_4"
}

variable "pgsql_version" {
  description = "The version of the PostgreSQL Server"
  default     = "9.6"
}

variable "storagesize_mb" {
  description = "Specifies the version of PostgreSQL to use"
  default     = 640000
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  default     = "canadacentral"
}

variable "resource_group" {
  description = "The name of the resource group in which to create the PostgreSQL Server"
}

variable "subnet_id" {
  description = "The ID of the subnet that the PostgreSQL server will be connected to"
}

variable "firewall_rules" {
  type        = list(string)
  description = "Specifies the Start IP Address associated with this Firewall Rule"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this server"
  default     = false
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections"
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The mimimun TLS version to support on the sever"
  default     = "TLS1_2"
}

# Parameters

variable "client_min_messages" {
  description = "Sets the message levels that are sent to the client"
  default     = "log"
}

variable "debug_print_parse" {
  description = "Logs each query's parse tree"
  default     = "off"
}

variable "debug_print_plan" {
  description = "Logs each query's execution plan"
  default     = "off"
}

variable "debug_print_rewritten" {
  description = "Logs each query's rewritten parse tree"
  default     = "off"
}

variable "log_checkpoints" {
  description = "Logs each checkpoint"
  default     = "off"
}

variable "log_connections" {
  description = "Logs each successful connection"
  default     = "on"
}

variable "log_disconnections" {
  description = "Logs end of a session, including duration"
  default     = "on"
}

variable "log_duration" {
  description = "Logs the duration of each completed SQL statement"
  default     = "off"
}

variable "log_error_verbosity" {
  description = "Sets the verbosity of logged messages"
  default     = "default"
}

variable "log_line_prefix" {
  description = "Sets the printf-style string that is output at the beginning of each log line"
  default     = "%t-%c-"
}

variable "log_lock_waits" {
  description = "Logs long lock waits"
  default     = "off"
}

variable "log_min_duration_statement" {
  description = "Sets the minimum execution time (in milliseconds) above which statements will be logged. -1 disables logging statement durations"
  default     = "10"
}

variable "log_min_error_statement" {
  description = "Causes all statements generating error at or above this level to be logged"
  default     = "error"
}

variable "log_min_messages" {
  description = "Sets the message levels that are logged"
  default     = "warning"
}

variable "log_retention_days" {
  description = "Sets how many days a log file is saved for"
  default     = "7"
}

variable "log_statement" {
  description = "Sets the type of statements logged"
  default     = "ddl"
}

variable "row_security" {
  description = "Enable row security"
  default     = "on"
}

variable "checkpoint_warning" {
  description = "Enables warnings if checkpoint segments are filled more frequently than this. Unit is s"
  default     = "0"
}

variable "connection_throttling" {
  description = "Enables temporary connection throttling per IP for too many invalid password login failures"
  default     = "on"
}

variable "maintenance_work_mem" {
  description = "Sets the maximum memory to be used for maintenance operations. Unit is kb"
  default     = "32000"
}

variable "min_wal_size" {
  description = "Sets the minimum size to shrink the WAL to. Unt is mb"
  default     = "512"
}

variable "max_wal_size" {
  description = "Sets the WAL size that triggers a checkpoint. Unit is mb"
  default     = "512"
}

variable "pg_stat_statements_track_utility" {
  description = "Selects whether utility commands are tracked by pg_stat_statements"
  default     = "off"
}

variable "pg_qs_track_utility" {
  description = "Selects whether utility commands are tracked by pg_qs"
  default     = "on"
}

variable "pg_qs_query_capture_mode" {
  description = "Selects which statements are tracked by pg_qs"
  default     = "top"
}

variable "pgms_wait_sampling_query_capture_mode" {
  description = "Selects which statements are tracked by the pgms_wait_sampling extension"
  default     = "all"
}

variable "synchronous_commit" {
  description = "Sets the current transaction's synchronization level"
  default     = "on"
}

variable "temp_buffers" {
  description = "Sets the maximum number of temporary buffers used by each database session. Unit is 8kb"
  default     = "16384"
}

variable "wal_buffers" {
  description = "Sets the number of disk-page buffers in shared memory for WAL. Any change requires restarting the server to take effect. Unit is 8kb"
  default     = "8192"
}

variable "wal_writer_delay" {
  description = "Time between WAL flushes performed in the WAL writer. Unit is ms"
  default     = "200"
}

variable "wal_writer_flush_after" {
  description = "Amount of WAL written out by WAL writer that triggers a flush. Unit is 8kb"
  default     = "128"
}

variable "work_mem" {
  description = "Sets the amount of memory to be used by internal sort operations and hash tables before writing to temporary disk files. Unit is kb"
  default     = "2048000"
}

variable "key_vault_id" {
  description = "The Key Vault id for the Customer Managed Key"
  default     = ""
}

variable "active_directory_administrator_object_id" {
  description = "The Active Directory Administrator Object ID"
  default     = ""
}

variable "active_directory_administrator_tenant_id" {
  description = "The Active Directory Administrator Tenant ID"
  default     = ""
}
