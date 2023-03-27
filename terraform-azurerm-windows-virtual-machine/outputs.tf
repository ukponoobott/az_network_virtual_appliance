output "virual_machine_id" {
  value = azurerm_windows_virtual_machine.this.id
}

output "vm_private_ip" {
  value = azurerm_windows_virtual_machine.this.private_ip_address
}

