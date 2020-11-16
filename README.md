# Terraform for Azure Managed Database PostgreSQL

The overall flow for this module is pretty simple:

* Create Azure storage account to store Terraform state
* Create Azure Managed Database configuration in a modular manner
* Instantiate the PaaS service

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
administrator_login          = ""
administrator_login_password = ""
database_names               = []
location                     = ""
name                         = ""
pgsql_version                = ""
resource_group               = ""
sku_name                     = ""
storagesize_mb               = ""
subnet_id                    = ""
```

## Variables Values

| Name                 | Type   | Required | Value                                                                                  |
|----------------------|--------|----------|----------------------------------------------------------------------------------------|
| subnet_id            | string | yes      | The azure subscription id to use for backing up cluster virtual machines/disks         |

## History

| Date     | Release    | Change                             |
|----------|------------|------------------------------------|
| 20201027 | 20201027.1 | Initial relase of Terraform module |
