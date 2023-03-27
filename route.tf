resource "azurerm_route_table" "main" {
  name                          = "acceptanceTestRouteTable1"
  location                      = azurerm_resource_group.main.location
  resource_group_name           = azurerm_resource_group.main.name
  disable_bgp_route_propagation = false
}

resource "azurerm_route" "nva" {
  name                   = "acceptanceTestRoute1"
  resource_group_name    = azurerm_resource_group.main.name
  route_table_name       = azurerm_route_table.main.name
  address_prefix         = "10.0.1.0/24"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = module.nva.vm_private_ip
}

resource "azurerm_subnet_route_table_association" "public" {
  subnet_id      = azurerm_subnet.this["public"].id
  route_table_id = azurerm_route_table.main.id
}