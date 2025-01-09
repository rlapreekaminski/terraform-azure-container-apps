resource "azurerm_key_vault" "kv" {
  name                = "kv-${var.product_code}-frc-${var.environment}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tenant_id           = local.tenant_id
  sku_name            = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = true
}
