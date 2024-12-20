variable "app_name" {
  type        = string
  description = "The name for this Container App."
}

variable "environment_id" {
  type        = string
  description = "The ID of the Container App Environment within which this Container App should exist."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Container App is to be created."
}

variable "resource_group_id" {
  type        = string
  description = "Id of the resource group in which the Container App is to be created."
}

variable "container_name" {
  type        = string
  description = "The name of the container."
}

variable "image" {
  type        = string
  description = "The image to use to create the container."
  default     = ""
}

variable "container_cpu" {
  type        = string
  description = "The amount of vCPU to allocate to the container. Possible values include 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, and 2.0. When there's a workload profile specified, there's no such constraint."
}

variable "container_memory" {
  type        = string
  description = "The amount of memory to allocate to the container. Possible values are 0.5Gi, 1Gi, 1.5Gi, 2Gi, 2.5Gi, 3Gi, 3.5Gi and 4Gi. When there's a workload profile specified, there's no such constraint."
}

variable "min_replicas" {
  type        = string
  description = "The minimum number of replicas for this container."
}

variable "max_replicas" {
  type        = string
  description = "The maximum number of replicas for this container."
}

variable "dapr_enabled" {
  type        = bool
  description = "Flag to enable or disable Dapr for this container."
  default     = false
}

variable "uai_id" {
  type        = string
  description = "The ID of the User Assigned Identity to assign to the container."
}

variable "cosmosdb_account_id" {
  type        = string
  description = "The ID of the CosmosDB account to which this container app should have access."
  default     = null
}

variable "cosmosdb_account_name" {
  type        = string
  description = "The name of the CosmosDB account to which this container app should have access."
  default     = null
}

variable "cosmosdb_database_names" {
  type        = list(string)
  description = "The names of the CosmosDB databases to which this container app should have access."
  default     = []
}