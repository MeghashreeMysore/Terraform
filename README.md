# TerraformProjects
Create Terraform Configuration to Host Static Website on Azure

**#Terraform Naming conventions:**
1.versions.tf
2.main
3.variables.tf
4.outputs.tf
5.terraform.tfvars

Terraform Static website is hosted using the above terraform configuration files.

**#Step-01 versions.tf**
Terraform required version, azurerm, random and null providers source and versioning.
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      Source = "hashicorp/azurerm"
      version = ">= 2.0"
      }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.0"
    }
   }
  }

  **#Step-02 variables.tf**
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

  **#Step-03: main.tf**
  #Provider Block
  provider "azurerm" {
    features {}
  }

  #Random String Resource
  resource "random_string" "myrandomstring" {
    length = 6
    special = false
    upper = false
    number = false
  }

  #Create Resource Group
  resource "azurerm_resource_group" "myresourcegroup" {
    name = var.resource_group_name
    location = var.location
  }
  
  #Create Storage Account
  resource "azurerm_storage_account" "mystorageaccount" {
    name = "${var.storage_account_name}${var.random_string.myrandomstring.id}"
    resource_group_name = azurerm_resource_group.myresourcegroup.name
    location = var.location
    account_tier = var.storage_account_tier
    account_replication = var.storage_account_replication_type
    account_kind = var.storage_account_kind

    static_website {
    index_document = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
    }
  }

  **#Step-04: terraform.tfvars**
  location = "eastus"
  resource_group_name = "myrg"
  storage_account_name = "staticwebsite"
  storage_account_tier = "standard"
  storage_account_replication_type = "LRS"
  storage_account_kind = "StorageV2"
  static_website_index_document = "index.html"
  static_website_error_404_document = "error.html"
  static_website_folder = ../

  **#Step-05 Outputs.tf**
  output variable definitions
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

  **#Step-06 Executing terraform commands**
  #Terraform initialize
  terraform init

  #Terraform Validate
  terraform validate

  #Terraform Format
  terraform fmt

  #Terraform Plan
  terraform plan

  #Terraform Apply
  terrraform apply -auto-approve

  #Upload Static Content
  1.Go to Storage Accounts -> stdproj1 -> Containers ->$Web
  2.Upload files from folder  "static-content" 

  #Verify
  1.Azure Storage Account Created
  2.Static Website Setting enabled
  3.Verify the Staic Content Upload Successful
  4.Access Static Website: Go to Storage Account -> stdproj1 -> Data Management -> Static Website

  Step-07 Destroy and Clean Up
  terraform destroy -auto-approve

  #Delete Terraform files
  rm -rf .terraform*
  rm -rf terraform.tfstate*

  #Conclusion
  Using above terraform configurations we have hosted a static website in Azure Storage Account in seconds.

  
