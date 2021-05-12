terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = "= 0.13.6"
  backend "azurerm" {
    resource_group_name  = "RG-Terraform-State"
    storage_account_name = "brightterraformstate"
    container_name       = "rg-progression-framework"
    key                  = "progression-framework.terraform.tfstate"
  }
}

provider "azurerm" {
  version = "=2.49.0"
  features {}
}