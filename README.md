# Terraform for Azure Managed Database PostgreSQL

The overall flow for this module is pretty simple:

* Create Azure storage account to store Terraform state
* Create Azure managed database configuration in a modular manner
* Add any extensions you need for the PostgeSQL managed database service

## Security Controls

* None

## Dependencies

* None

## Optional (depending on options configured)

* None

## Enabling Extensions

Azure Database for PostgreSQL supports a subset of key extensions that are listed in the link below. This information is also available by running `SELECT * FROM pg_available_extensions;`.

For instance, application teams that have functionality that needs encryption can enable pg_crypto by using the `CREATE EXTENSION` command.

https://docs.microsoft.com/en-us/azure/postgresql/concepts-extensions

## Usage

```terraform
name                             = var.managed_postgresql_name
database_names                   = ["application"]
dependencies                     = []
administrator_login              = "pgsqladmin"
administrator_login_password     = var.managed_postgresql_password
sku_name                         = "GP_Gen5_4"
pgsql_version                    = "11"
storagesize_mb                   = 256000
location                         = "canadacentral"
resource_group                   = "XX-XXXX-XXXX-XXX-XXX-RGP"
subnet_id                        = var.managed_postgresql_subnet_id
firewall_rules                   = []
public_network_access_enabled    = true
ssl_enforcement_enabled          = true
ssl_minimal_tls_version_enforced = "TLS1_2"
```

## Variables Values

| Name                             | Type   | Required | Value                                                                                  |
|----------------------------------|--------|----------|----------------------------------------------------------------------------------------|
| name                             | string | yes      | The name of the PostgreSQL Server                                                      |
| database_names                   | list   | yes      | The name of the PostgreSQL database(s)                                                 |
| dependencies                     | list   | yes      | Dependency management of resources                                                     |
| administrator_login              | string | yes      | The Administrator Login for the PostgreSQL Server                                      |
| administrator_login_password     | string | yes      | The Password associated with the administrator_login for the PostgreSQL Server         |
| sku_name                         | string | yes      | Specifies the SKU Name for this PostgreSQL Server                                      |
| pgsql_version                    | string | yes      | The version of the PostgreSQL Server                                                   |
| storagesize_mb                   | string | yes      | Specifies the version of PostgreSQL to use                                             |
| location                         | string | yes      | Specifies the supported Azure location where the resource exists                       |
| resource_group                   | string | yes      | The name of the resource group in which to create the PostgreSQL Server                |
| subnet_id                        | string | yes      | The ID of the subnet that the PostgreSQL server will be connected to                   |
| firewall_rules                   | list   | yes      | Specifies the Start IP Address associated with this Firewall Rule                      |
| public_network_access_enabled    | string | yes      | Whether or not public network access is allowed for this server                        |
| ssl_enforcement_enabled          | string | yes      | Specifies if SSL should be enforced on connections                                     |
| ssl_minimal_tls_version_enforced | string | yes      | The mimimun TLS version to support on the sever                                        |

## History

| Date     | Release    | Change                                     |
|----------|------------|--------------------------------------------|
| 20201027 | 20201027.1 | Initial relase of Terraform module         |
| 20201219 | 20201219.1 | Add additional variables and documentation |
