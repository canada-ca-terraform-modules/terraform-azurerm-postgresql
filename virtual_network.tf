resource "azurerm_virtual_network" "pgsql" {
  count = var.vnet_enable ? 1 : 0

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.vnet_cidr
}

resource "azurerm_subnet" "pgsql" {
  count = var.subnet_enable ? 1 : 0

  name                 = var.name
  resource_group_name  = var.resource_group
  virtual_network_name = var.vnet_enable ? azurerm_virtual_network.pgsql[0].name : data.azurerm_virtual_network.pgsql[0].name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage"]
}
