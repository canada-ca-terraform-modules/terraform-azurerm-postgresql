## v1.1.x to v2.0.x

Run the following commands:

```sh
terraform state rm 'module.postgresql_example.azurerm_postgresql_database.pgsql'

terraform import  'module.postgresql_example.azurerm_postgresql_database.pgsql["psqlservername1"]' '/subscriptions/SUBSCRIPTION_UUID/resourceGroups/psql-dev-rg/providers/Microsoft.DBforPostgreSQL/servers/psqlservername/databases/psqlservername1'
...
terraform import  'module.postgresql_example.azurerm_postgresql_database.pgsql["psqlservername4"]' '/subscriptions/SUBSCRIPTION_UUID/resourceGroups/psql-dev-rg/providers/Microsoft.DBforPostgreSQL/servers/psqlservername/databases/psqlservername4'
```

> Note: These are just values based on the [examples/](examples/) folder.
