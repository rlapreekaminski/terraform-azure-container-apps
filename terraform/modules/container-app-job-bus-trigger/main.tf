resource "azurerm_container_app_job" "job" {
  name                         = var.app_name
  location                     = var.resource_group_location
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id

  replica_timeout_in_seconds = 30
  replica_retry_limit        = 0

  event_trigger_config {
    replica_completion_count = 1
    parallelism              = 1
    scale {
      min_executions              = 0
      max_executions              = 5
      polling_interval_in_seconds = 20
      rules {
        name             = var.sb_rule_name
        custom_rule_type = "azure-servicebus"
        metadata = {
          message_count = "5"
          namespace     = var.sb_namespace
          queueName     = var.sb_queue_name
        }

        authentication {
          secret_name       = "servicebussecret"
          trigger_parameter = "connection"
        }
      }
    }
  }

  template {
    container {
      image  = var.container_image
      name   = var.app_name
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  registry {
    server   = var.acr_server
    identity = var.uai_id
  }

  secret {
    name  = "servicebussecret"
    value = var.sb_auth_secret
  }
}
