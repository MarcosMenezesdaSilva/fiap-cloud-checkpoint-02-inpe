
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.83"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-fiap-cp02-tfstate"
    storage_account_name = "stcp02rm561547tfstate"
    container_name       = "tfstate"
    key                  = "monitor-queimadas.tfstate"

    use_oidc         = true
    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}
}
