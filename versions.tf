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
