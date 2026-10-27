terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstatesujeet01"
    container_name       = "tfstate"
    key                  = "preprod-dns.tfstate"
  }
}

provider "azurerm" {
  features {}
}
