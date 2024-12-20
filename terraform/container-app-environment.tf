resource "azurerm_container_app_environment" "cae" {
  name                                        = "cae-${var.product_name}-${var.region_code}-${var.environment}"
  location                                    = var.region
  resource_group_name                         = azurerm_resource_group.resource_group.name
  log_analytics_workspace_id                  = azurerm_log_analytics_workspace.log.id
  dapr_application_insights_connection_string = azurerm_application_insights.appi.connection_string

  tags = local.default_tags
}