variable "app_name" {
  type        = string
  description = "The name for this Container App Job."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group in which the Container App Job is to be created."
}

variable "resource_group_id" {
  type        = string
  description = "Id of the resource group in which the Container App Job is to be created."
}

variable "container_app_environment_id" {
  type        = string
  description = "The ID of the container app environment."
}

variable "container_image" {
  type        = string
  description = "The container image to use for the container app job."
}

variable "storage_account_connection_string" {
  type        = string
  description = "The connection string for the storage account."
}

variable "appi_connection_string" {
  type        = string
  description = "The connection string for the Application Insights instance."
}