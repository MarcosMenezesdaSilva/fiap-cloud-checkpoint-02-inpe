
# ============================================================
# FIAP - CHECKPOINT 02
# VARIAVEIS TERRAFORM
# ============================================================


# ============================================================
# 1. RESOURCE GROUP
# ============================================================

variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
  default     = "rg-fiap-cp02-queimadas"
}


# ============================================================
# 2. REGIAO DO RESOURCE GROUP
# Nao alterar: recurso existente em Brazil South
# ============================================================

variable "location" {
  type        = string
  description = "Regiao do Resource Group"
  default     = "brazilsouth"
}


# ============================================================
# 3. REGIAO DO MYSQL
# Nova regiao para tentativa de provisionamento
# ============================================================

variable "mysql_location" {
  type        = string
  description = "Regiao do MySQL Flexible Server"
  default     = "eastus"
}


# ============================================================
# 4. USUARIO ADMINISTRADOR DO MYSQL
# ============================================================

variable "mysql_admin_username" {
  type        = string
  description = "Administrador do MySQL Flexible Server"
  default     = "queimadasadmin"
}


# ============================================================
# 5. SENHA ADMINISTRADOR MYSQL
# Recebida pelo GitHub Actions Secret
# ============================================================

variable "mysql_admin_password" {
  type        = string
  description = "Senha do administrador MySQL"
  sensitive   = true
}


# ============================================================
# 6. BANCO DE DADOS
# ============================================================

variable "database_name" {
  type        = string
  description = "Nome do banco de dados"
  default     = "queimadas"
}
