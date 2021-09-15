# Get adminuser password from Key Vault Secrets

data "azurerm_key_vault_secret" "adminpassword" {
  name         = var.adminUser
  key_vault_id = var.keyVaultId
}
