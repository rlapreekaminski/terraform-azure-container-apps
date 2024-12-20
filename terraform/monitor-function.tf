resource "azurerm_storage_account" "safunc" {
  name                     = "safunc${var.product_code}${var.region_code}${var.environment}"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "container_function" {
  source = "./modules/container-app-function"

  app_name                          = "func-monitoring-${var.region_code}-${var.environment}"
  resource_group_location           = azurerm_resource_group.resource_group.location
  resource_group_id                 = azurerm_resource_group.resource_group.id
  container_app_environment_id      = azurerm_container_app_environment.cae.id
  container_image                   = coalesce(var.container_func_image, "mcr.microsoft.com/azure-functions/dotnet7-quickstart-demo:1.0")
  storage_account_connection_string = azurerm_storage_account.safunc.primary_connection_string
  appi_connection_string            = azurerm_application_insights.appi.connection_string
}