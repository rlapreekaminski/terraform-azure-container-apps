resource "azurerm_application_insights" "appi" {
  name                = "appi-${var.product_name}-${var.region_code}-${var.environment}"
  location            = var.region
  resource_group_name = azurerm_resource_group.resource_group.name
  workspace_id        = azurerm_log_analytics_workspace.log.id
  application_type    = "web"

  tags = local.default_tags
}