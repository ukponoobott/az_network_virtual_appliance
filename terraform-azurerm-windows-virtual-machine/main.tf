resource "azurerm_network_interface" "this" {
  name                 = "${var.workload}-nic"
  location             = var.location
  resource_group_name  = var.resource_group_name
  enable_ip_forwarding = var.enable_ip_forwarding

  ip_configuration {
    name                          = "${var.workload}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_windows_virtual_machine" "this" {
  name                = "${var.workload}-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  user_data = var.user_data
}