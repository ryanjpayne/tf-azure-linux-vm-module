# tf-azure-linux-vm-module
Terraform module to deploy a Linux VM and programmatically retrieve admin password from Azure Key Vault.
  
## Dependencies  
The following must exist or be created in your root module when running this configuration.
- Resource Group
- VNET
- Subnet
  
## Inputs  
**vnetName** - (Required) The name of the VNET in which to create the Network Interface.
**subnetName** - (Required) The name of the subnet in which to create the Network Interface.
**vmName** - (Required) The name of the Virtual Machine. Changing this forces a new resource to be created.  
**location** - (Required) The location/region where the virtual network is created. Changing this forces a new resource to be created.  
**resourceGroupName** - (Required) The name of the resource group in which to create the virtual network.  
**environment** - (Required) The Environment tag to apply to new resources.  
**vmSize** - (Required) The SKU which should be used for this Virtual Machine, such as Standard_F2.  
**osDiskSize** - (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from.  
**keyVaultId** - (Optional) The ID of the Key Vault in which the adminPassword secret is stored.  If this input is not used, adminPassword is required.  
**adminUser** - (Required) The name of the administrator user and the name of the secret stored in the keyvault.  
**adminPassword** - (Optional) This value will override the secret-based password in case you do not have a password stored in Azure Key Vault.  If this input is not used, keyVaultId is required.  
  
## Example Usage  
  
```
module "example-vm" {  
	source = "$/Common Cloud/Terraform/Azure/linux-vm-module"  
    
	vnetName          = "example-vnet"
	subnetName        = "example-subnet"
	vmName            = "example-linux-vm"  
	location          = "USGov Virginia"  
	resourceGroupName = "example-rg"  
	environment       = "sandbox"  
	vmSize            = "Standard_F2"
	osDiskSize        = "100"
	keyVaultId        = "example-vault"
	adminUser         = "administrator"
	#adminPassword     = ""
}  	
```
  
## Outputs  
**name** - The name of the Linux Virtual Machine.  
**location** - The Azure location of the Linux Virtual Machine.  
**size** - The SKU used for this Virtual Machine.  
**private_ip_address** - The Primary Private IP Address assigned to this Virtual Machine.  
**admin_username** - The username of the local administrator.  
**admin_password** - The password for the local administrator.  
