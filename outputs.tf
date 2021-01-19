output "id" {
  value = azurerm_postgresql_server.pgsql.id
}

output "name" {
  value = azurerm_postgresql_server.pgsql.name
}

output "administrator_login" {
  value = azurerm_postgresql_server.pgsql.administrator_login
}

output "identity_tenant_id" {
	value = azurerm_postgresql_server.pgsql.identity[0].tenant_id
}

output "identity_object_id" {
	value = azurerm_postgresql_server.pgsql.identity[0].principal_id
}

# Part of a hack for module-to-module dependencies.
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-449158607
# and
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-473091030
output "depended_on" {
  value = "${null_resource.dependency_setter.id}-${timestamp()}"
}
