resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "cosmos-${var.product_code}-frc-${var.environment}"
  location            = "francecentral"
  resource_group_name = azurerm_resource_group.resource_group.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = "francecentral"
    failover_priority = 0
  }

  geo_location {
    location          = "westus"
    failover_priority = 1
  }

  tags = local.default_tags
}

resource "azurerm_cosmosdb_sql_database" "users_database" {
  count = local.cosmosdb_database_lenght

  name                = local.cosmosdb_database_names[count.index]
  resource_group_name = azurerm_cosmosdb_account.cosmos.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
  throughput          = 400
}
