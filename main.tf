 #Provider Block
  provider "azurerm" {
    features {}
  }

  #Random String Resource
  resource "random_string" "myrandomstring" {
    length = 6
    special = false
    upper = false
    numeric = false
  }

  #Create Resource Group
  resource "azurerm_resource_group" "myresourcegroup" {
    name = var.resource_group_name
    location = var.location
  }
  
  #Create Storage Account
  resource "azurerm_storage_account" "mystorageacc"  {
    name = "${var.storage_account_name}${var.random_string.myrandomstring.id}"
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    
    location = var.location
    account_tier = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type
    account_kind = var.storage_account_kind

    static_website {
    index_document = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
    }
  }
