terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.13.0"
    }
  }
}

resource "azapi_resource" "caf" {
  type                      = "Microsoft.Web/sites@2022-09-01"
  name                      = var.app_name
  location                  = var.resource_group_location
  parent_id                 = var.resource_group_id
  schema_validation_enabled = false
  body = jsonencode({
    kind = "functionapp"
    properties = {
      managedEnvironmentId = var.container_app_environment_id
      siteConfig = {
        linuxFxVersion = "DOCKER|${var.container_image}"
        appSettings = [
          {
            name  = "AzureWebJobsStorage"
            value = var.storage_account_connection_string
          },
          {
            name  = "APPLICATIONINSIGHTS_CONNECTION_STRING"
            value = var.appi_connection_string
          },
          {
            name  = "FUNCTIONS_EXTENSION_VERSION"
            value = "~4"
          }
        ]
      }
    }
  })
}