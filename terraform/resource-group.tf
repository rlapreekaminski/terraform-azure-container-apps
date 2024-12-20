resource "azurerm_resource_group" "resource_group" {
  name     = "rg-${var.product_name}-${var.region_code}-${var.environment}"
  location = var.region
}