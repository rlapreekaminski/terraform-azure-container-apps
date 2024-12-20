output "id" {
  description = "The ID of the Container App"
  value       = azurerm_container_app.ca.id
}

output "latest_revision_fqdn" {
  description = "The FQDN of the Latest Revision of the Container App."
  value       = azurerm_container_app.ca.latest_revision_fqdn
}

output "latest_revision_name" {
  description = "The name of the latest Container Revision."
  value       = azurerm_container_app.ca.latest_revision_name
}