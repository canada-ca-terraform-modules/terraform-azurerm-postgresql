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

variable "resource_group" {
  description = "The name of the resource group in which resources will be created"
}

variable "sku_name" {
  description = "The SKU name which associates to a known machine type/size"
  default     = "GP_Gen5_4"
}

variable "storagesize_mb" {
  description = "The storage size that the PostgreSQL server will use"
  default     = 640000
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "subscription_id" {
  description = "The Subscription ID"
}

variable "tenant_id" {
  description = "The Tenant ID"
}
