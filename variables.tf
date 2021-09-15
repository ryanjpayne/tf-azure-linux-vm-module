# Establish input variables

variable "subnetName" {
  default = ""
}

variable "vnetName" {
  default = ""
}

variable "vmName" {
  default = ""
}

variable "location" {
  default = ""
}

variable "resourceGroupName" {
  default = ""
}

variable "environment" {
  default = ""
}

variable "vmSize" {
  default = ""
}

variable "osDiskSize" {
  default = ""
}

variable "keyVaultId" {
  default = ""
}

variable "adminUser" {
  default = ""
}

variable "adminPassword" {
  default = data.azurerm_key_vault_secret.adminpassword
}
