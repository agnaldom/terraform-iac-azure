provider "azurerm" {
  version = "=2.0.0"
  features{}
}

resource "azurerm_resource_group" "example" {
  name = "exemple-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}