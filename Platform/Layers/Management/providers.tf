terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.19.0"
      configuration_aliases = [
        azurerm.management,
      ]
    }
  }
  backend "azurerm" {}
}

# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Core resources".

provider "azurerm" {
  features {}
}

# Declare an aliased provider block using your preferred configuration.
# This will be used for the deployment of all "Connectivity resources" to the specified `subscription_id`.

provider "azurerm" {
  alias           = "management"
  subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxx"
  features {}
}