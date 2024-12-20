
resource "azurerm_container_app" "ca" {
  name                         = var.app_name
  container_app_environment_id = var.environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  template {
    container {
      name   = var.container_name
      image  = coalesce(var.image, "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest")
      cpu    = var.container_cpu
      memory = var.container_memory
    }
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas
  }

  ingress {
    target_port = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  dynamic "dapr" {
    for_each = var.dapr_enabled ? [1] : []
    content {
      app_port     = 80
      app_id       = var.app_name
      app_protocol = "http"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.uai_id]
  }
}

resource "azurerm_cosmosdb_sql_role_definition" "aca_role" {
  count = length(var.cosmosdb_database_names)

  name                = "${var.cosmosdb_database_names[count.index]}_role_definition"
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  assignable_scopes   = ["${var.cosmosdb_account_id}/dbs/${var.cosmosdb_database_names[count.index]}"]

  permissions {
    data_actions = [
      "Microsoft.DocumentDB/databaseAccounts/readMetadata",
      "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*",
    "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*"]
  }
}