#output variable definitions
  output "resource_group_id" {
    description = "resource group id"
    value = azurerm_resource_group.myresourcegroup.id
  }
  output "resource_group_name" {
    description = "resource group name"
    value = azurerm_resource_group.myresourcegroup.name
  }
  output "resource_group_location" {
    description = "resource group location"
    value = azurerm_resource_group.myresourcegroup.location
  }
  output "Storage_account_id" {
    description = "Storage_account_id"
    value = azurerm_resource_group.mystorageaccount.id
  }
  output "Storage_account_name" {
    description = "Storage_account_name"
    value = azurerm_resource_group.mystorageaccount.name
  }
