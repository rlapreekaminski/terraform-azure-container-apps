#  Terraform backend
terraform {
  required_version = ">=1.10.2"

  backend "azurerm" {
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.14.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}