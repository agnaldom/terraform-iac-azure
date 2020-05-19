# Get Resources from a Resource Grup

data "azurerm_resource_group" "rg" {
  name = "SOMOS_SSK"
}

resource "azurerm_app_service_plan" "somos_asp" {
  name           = "lideremmin-plan"
  location       = data.azurerm_resource_group.rg.location
  resource_group = data.azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "somos_as" {
  name                = "lideremin-service"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.somos_asp.id


  tags  = {
    data-criacao  = "2020-05-19"
    cadeia-valor  = "somos"
    estagio       = "DEV"
    centro-custos = "somos"
    tag-servico   = "lideremmim-app-service"
  }
}

