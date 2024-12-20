locals {
  backend_service_code = "backend"
  front_service_code   = "front"

  cosmosdb_database_names  = ["users", "orders"]
  cosmosdb_database_lenght = local.cosmosdb_database_names == null ? 0 : length(local.cosmosdb_database_names)

  default_tags = {
    environment : "${var.environment}"
    owner : "${var.owner}"
    productName : "${var.product_name}"
    productCode : "${var.product_code}"
  }
}