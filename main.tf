locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.name_prefix}-rg"
  location = var.location
}

module "network" {
  source              = "./modules/vnet"
  vnet_name           = "${local.name_prefix}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "${local.name_prefix}-subnet"
  subnet_prefix       = ["10.0.1.0/24"]
}

resource "azurerm_storage_account" "stg" {
  name                     = lower(replace("${var.project_name}${var.environment}stg", "-", ""))
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true
  }
}