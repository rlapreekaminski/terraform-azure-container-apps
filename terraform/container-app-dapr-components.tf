resource "azurerm_container_app_environment_dapr_component" "cosmos_databases_dapr_component" {
  count = local.cosmosdb_database_lenght

  name                         = "dapr-cosmos-${local.cosmosdb_database_names[count.index]}-${var.product_code}-${var.region_code}-${var.environment}"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  component_type               = "state.cosmosdb"
  version                      = "1.0"

  metadata {
    name  = "url"
    value = azurerm_cosmosdb_account.cosmos.endpoint
  }

  metadata {
    name  = "database"
    value = local.cosmosdb_database_names[count.index]
  }

  metadata {
    name  = "azureClientId"
    value = azurerm_user_assigned_identity.uai.client_id
  }
}

resource "azurerm_container_app_environment_dapr_component" "azure_service_bus_api_dapr_component" {
  name                         = "dapr-sb-topic-users-${var.product_code}-${var.region_code}-${var.environment}"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  component_type               = "servicebus-pubsub"
  version                      = "1.0"

  metadata {
    name        = "connectionString"
    secret_name = "service-bus-connection-string"
  }

  secret {
    name  = "service-bus-connection-string"
    value = azurerm_cosmosdb_account.cosmos.primary_key
  }
}