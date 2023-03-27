resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "nva" {
  source               = "./terraform-azurerm-windows-virtual-machine"
  workload             = "nva"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  subnet_id            = azurerm_subnet.this["dmz"].id
  enable_ip_forwarding = true
  user_data            = filebase64("${path.module}/scripts/nva.ps1")

  depends_on = [
    azurerm_resource_group.main,
    azurerm_subnet.this
  ]
}

module "public" {
  source              = "./terraform-azurerm-windows-virtual-machine"
  workload            = "public"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = azurerm_subnet.this["public"].id
  user_data           = filebase64("${path.module}/scripts/icmp.ps1")

  depends_on = [
    azurerm_resource_group.main,
    azurerm_subnet.this
  ]
}

module "private" {
  source              = "./terraform-azurerm-windows-virtual-machine"
  workload            = "private"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = azurerm_subnet.this["private"].id
  user_data           = filebase64("${path.module}/scripts/icmp.ps1")

  depends_on = [
    azurerm_resource_group.main,
    azurerm_subnet.this
  ]
}