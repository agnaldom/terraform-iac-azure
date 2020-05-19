resource "azurerm_resource_group" "somos_rg" {
  name     = var.resource_group 
  location = var.azure_region

  /*tags = {
  
  }*/
}