# Get Resources from a Resource Group
data "azurerm_resource_group" "rg" {
  name = "SOMOS_SSK"
}

resource "azurerm_mysql_server" "mysql" {
  name                = "lideremmim"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku_name = "B_Gen5_2"

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
    auto_grow             = "Enabled"
  }

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "5.7"
  ssl_enforcement              = "Enabled"

  tags  = {
    data-criacao  = "2020-05-19"
    cadeia-valor  = "somos"
    estagio       = "DEV"
    centro-custos = "somos"
    tag-servico   = "lideremmim-mysql"
  }
}

resource "azurerm_mysql_database" "lideremmim" {
  name                = "lideremmim"
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}