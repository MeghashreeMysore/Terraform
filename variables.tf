#Input variable definition
variable "location" {
    type = "The azure region in which all resources should be created"
    description = string
  }
  variable "resource_group_name" {
    type = "name of resource group"
    description = string
  }
  variable "storage_account_name" {
    type = "The name of storage account"
    description = string
  }
  variable "storage_account_tier" {
    type = "storage account tier"
    description = string
  }
  variable "storage_account_replication_type" {
    type = "storage_account_replication_type"
    description = string
  }
  variable "storage_account_kind" {
    type = "Storage Account Kind"
    description = string
  }
  variable "static_website_index_document" {
    type = "static_website_index_document"
    description = string
  }
  variable "static_website_error_404_document" {
    type = "static_website_error_404_document"
    description = string
  }
