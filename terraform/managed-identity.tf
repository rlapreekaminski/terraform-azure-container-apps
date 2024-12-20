resource "azurerm_user_assigned_identity" "uai" {
  location            = azurerm_resource_group.resource_group.location
  name                = "id-apps-${var.region_code}-${var.environment}"
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_resource_group.resource_group.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.uai.principal_id
}
