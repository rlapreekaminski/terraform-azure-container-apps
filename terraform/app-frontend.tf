module "container_app_front" {
  source = "./modules/container-app"

  app_name            = "ca-${local.front_service_code}-${var.region_code}-${var.environment}"
  environment_id      = azurerm_container_app_environment.cae.id
  resource_group_name = azurerm_resource_group.resource_group.name
  resource_group_id   = azurerm_resource_group.resource_group.id
  container_name      = local.front_service_code
  container_cpu       = 0.25
  container_memory    = "0.5Gi"
  min_replicas        = 0
  max_replicas        = 5
  uai_id              = azurerm_user_assigned_identity.uai.id
}
