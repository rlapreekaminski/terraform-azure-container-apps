module "container_job" {
  source = "./modules/container-app-job-bus-trigger"

  app_name                     = "ca-process-job-${var.region_code}-${var.environment}"
  resource_group_location      = azurerm_resource_group.resource_group.location
  resource_group_name          = azurerm_resource_group.resource_group.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  container_image              = coalesce(var.container_job_image, "mcr.microsoft.com/k8se/quickstart-jobs:latest")
  acr_server                   = azurerm_container_registry.acr.login_server
  sb_namespace                 = azurerm_servicebus_namespace.sb.name
  sb_rule_name                 = "trigger-rule"
  sb_queue_name                = azurerm_servicebus_queue.process_queue.name
  sb_auth_secret               = azurerm_servicebus_queue_authorization_rule.process_queue_sender_auth.primary_connection_string
  uai_id                       = azurerm_user_assigned_identity.uai.id
}