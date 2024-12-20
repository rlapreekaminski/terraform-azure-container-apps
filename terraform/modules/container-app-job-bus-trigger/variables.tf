variable "app_name" {
  type        = string
  description = "The name for this Container App Job."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group in which the Container App Job is to be created."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group in which the Container App Job is to be created."
}

variable "container_app_environment_id" {
  type        = string
  description = "The ID of the container app environment."
}

variable "container_image" {
  type        = string
  description = "The container image to use for the container app job."
}

variable "acr_server" {
  type        = string
  description = "The server name of the container registry."
}

variable "uai_id" {
  type        = string
  description = "The ID of the User Assigned Identity to assign to the container."
}

variable "sb_namespace" {
  type        = string
  description = "The name of the Service Bus namespace."
}

variable "sb_rule_name" {
  type        = string
  description = "The name of the Service Bus rule."
}

variable "sb_queue_name" {
  type        = string
  description = "The name of the Service Bus queue."
}

variable "sb_auth_secret" {
  type        = string
  description = "The secret containing the Service Bus authentication credentials."
}