# Create Network Interface

resource "azurerm_network_interface" "vm-ni" {
  name                = "${var.environment}-${var.vmName}-NI"
  location            = var.location
  resource_group_name = var.resourceGroupName

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.target-subnet.id
    private_ip_address_allocation = "Static"
  }
}

# Create Linux VM

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = "${var.environment}-${var.vmName}
  location            = var.location
  resource_group_name = var.resourceGroupName
  size                = var.vmSize
  admin_username      = var.adminUser
  admin_password      = var.password

  network_interface_ids = [
    azurerm_network_interface.vm-ni.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.osDiskSize
  }

  ## Need to paramterize this block
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
