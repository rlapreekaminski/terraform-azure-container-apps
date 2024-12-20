variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "environment" {
  type        = string
  description = "Environment trigram used for resource names. For example, dev, uat, tst, ppd, prd, ..."
}

variable "product_name" {
  type        = string
  description = "Project name for the resource names."
}

variable "product_code" {
  type        = string
  description = "Project code used for the resource names. 3 letters maximum is recommended"
}

variable "owner" {
  type        = string
  description = "Owner of the solution"
}

variable "region" {
  type        = string
  description = "Region name used for resources, for example weu for West Europe."
}

variable "region_code" {
  type        = string
  description = "Region code used for resource group names, for example weu for West Europe. 3 letters maximum is recommended"
}

variable "container_job_image" {
  type        = string
  description = "The image used for the container job."
  default     = null
}

variable "container_func_image" {
  type        = string
  description = "The image used for the container function."
  default     = null
}

#####################
# Monitor configuration
#####################

variable "log_analytics_retention" {
  type        = number
  default     = 90
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. Default is 90."
}
