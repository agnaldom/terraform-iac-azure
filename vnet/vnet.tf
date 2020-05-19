# Creating the AKS Vnet

resource "azurerm_virtual_network" "somos_net" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.somos_rg.name
  location            = azurerm_resource_group.somos_rg.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "somos_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.somos_rg.name
  virtual_network_name = azurerm_virtual_network.somos_net.name
  address_prefix       = var.address_prefix
}

resource "azurerm_public_ip" "somos_public_ip" {
  name                = var.somos_public_ip_name
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.somos_rg.name
  allocation_method   = "Static"

  tags = {
    environment = "Somos-Dev"
  }
}