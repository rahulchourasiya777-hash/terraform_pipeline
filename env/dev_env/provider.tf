terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_backup"
    storage_account_name = "sabackup1234"
    container_name       = "backup1"
    key                  = "backup1.tfstate"
  }
}
provider "azurerm" {
  features {}
}