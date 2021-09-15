# Retrieve Subnet ID

data "azurerm_subnet" "target-subnet" {
  name                 = var.subnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.resourceGroupName
}

output "subnet_id" {
  value = data.azurerm_subnet.target-subnet.id
}
