
# ============================================================
# FIAP - CHECKPOINT 02
# CLOUD SOLUTIONS
# INFRAESTRUTURA AZURE - MYSQL FLEXIBLE SERVER
# ============================================================


# ============================================================
# 1. SUFIXO UNICO PARA O MYSQL
# ============================================================

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}


# ============================================================
# 2. RESOURCE GROUP
# Mantemos a regiao atual para preservar o recurso existente
# ============================================================

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


# ============================================================
# 3. MYSQL FLEXIBLE SERVER
# Regiao independente do Resource Group
# ============================================================

resource "azurerm_mysql_flexible_server" "mysql" {
  name = "mysql-queimadas-eastus-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name

  location = var.mysql_location

  administrator_login    = var.mysql_admin_username
  administrator_password = var.mysql_admin_password

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  sku_name = "B_Standard_B1ms"
  version  = "8.0.21"

  storage {
    size_gb = 20
  }
}


# ============================================================
# 4. BANCO DE DADOS MYSQL
# ============================================================

resource "azurerm_mysql_flexible_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name

  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}


# ============================================================
# 5. FIREWALL - SERVICOS AZURE
# ============================================================

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name

  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
