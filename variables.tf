variable "administrator_login" {
  description = "PostgreSql server admin login"
}

variable "administrator_login_password" {
  description = "PostgreSql server admin password"
}

variable "database_names" {
  type        = list(string)
  description = "List of database names to be used with PostgreSQL"
}

variable "location" {
  description = "The Azure region where the resources will be created"
  default     = "canadacentral"
}

variable "name" {
  description = "PostgreSQL server name"
}

variable "pgsql_version" {
  description = "The PostgreSQL server version"
  default     = "9.6"
}

variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled"
  default     = false
}

variable "resource_group" {
  description = "The name of the resource group in which resources will be created"
}

variable "sku_name" {
  description = "The SKU name which associates to a known machine type/size"
  default     = "GP_Gen5_4"
}

variable "ssl_enforcement_enabled" {
  description = "Whether the SSL enforced is enabled"
  default     = true
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The SSL minimal TLS enforced version"
  default     = "TLS1_2"
}

variable "storagesize_mb" {
  description = "The storage size that the PostgreSQL server will use"
  default     = 640000
}

// variable "subnet_id" {
//   description = "Subnet ID"
// }
