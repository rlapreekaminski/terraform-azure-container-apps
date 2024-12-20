resource "azurerm_container_registry" "acr" {
  name                   = "cr${var.product_code}${var.region_code}${var.environment}"
  location               = var.region
  resource_group_name    = azurerm_resource_group.resource_group.name
  sku                    = "Basic"
  admin_enabled          = true
  anonymous_pull_enabled = false
  tags                   = local.default_tags
}
