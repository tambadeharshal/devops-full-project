terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "devops" {
  name     = "rg-devops-full-project"
  location = "Central India"
}

resource "azurerm_container_registry" "acr" {
  name = "acrdevopsfulltf2026"
  resource_group_name = azurerm_resource_group.devops.name
  location            = azurerm_resource_group.devops.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-devops-full-project"

  location            = azurerm_resource_group.devops.location
  resource_group_name = azurerm_resource_group.devops.name

  dns_prefix = "aks-devops-full"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}