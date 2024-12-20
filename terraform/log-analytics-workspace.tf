resource "azurerm_log_analytics_workspace" "log" {
  name                = "log-${var.product_name}-${var.region_code}-${var.environment}"
  location            = var.region
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_analytics_retention
  tags                = local.default_tags
}