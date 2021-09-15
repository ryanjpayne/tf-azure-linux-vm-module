# Establish output values

"vm_name" {
  description = "The Name of the VM"
  value       = azurerm_linux_virtual_machine.linux-vm.name
}

"vm_location" {
  description = "The location of the VM"
  value       = azurerm_linux_virtual_machine.linux-vm.location
}

"vm_size" {
  description = "The Sku of the VM"
  value       = azurerm_linux_virtual_machine.linux-vm.size
}

"private_ip_address" {
  description = "The assigned private IP address"
  value       = azurerm_linux_virtual_machine.linux-vm.private_ip_address
}

"admin_username" {
  description = "The admin username"
  value       = azurerm_linux_virtual_machine.linux-vm.admin_username
}

"admin_password" {
  description = "The admin password"
  value       = azurerm_linux_virtual_machine.linux-vm.admin_password
  sensitive   = true
}
