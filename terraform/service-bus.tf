resource "azurerm_servicebus_namespace" "sb" {
  name                = "sb-${var.product_name}-${var.region_code}-${var.environment}"
  location            = var.region
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "Standard"

  tags = local.default_tags
}

resource "azurerm_servicebus_queue" "process_queue" {
  name         = "process-queue-${var.product_code}-${var.region_code}-${var.environment}"
  namespace_id = azurerm_servicebus_namespace.sb.id

  partitioning_enabled = true
}

resource "azurerm_servicebus_queue_authorization_rule" "process_queue_sender_auth" {
  name     = "container-job-queue-auth-${var.environment}"
  queue_id = azurerm_servicebus_queue.process_queue.id

  listen = false
  send   = true
  manage = false
}

resource "azurerm_servicebus_queue_authorization_rule" "process_queue_listener_auth" {
  name     = "container-job-queue-auth-${var.environment}"
  queue_id = azurerm_servicebus_queue.process_queue.id

  listen = true
  send   = false
  manage = false
}

####################
# Users topic
####################

resource "azurerm_servicebus_topic" "topic_users" {
  name         = "users-topic"
  namespace_id = azurerm_servicebus_namespace.sb.id

  partitioning_enabled = true
}

resource "azurerm_servicebus_subscription" "users_topic_orders_subscription" {
  name               = "users-topic-orders-subscription"
  topic_id           = azurerm_servicebus_topic.topic_users.id
  max_delivery_count = 1
}

resource "azurerm_servicebus_topic_authorization_rule" "users_topic_sender_auth" {
  name     = "sender"
  topic_id = azurerm_servicebus_topic.topic_users.id

  listen = false
  send   = true
  manage = false
}

resource "azurerm_servicebus_topic_authorization_rule" "users_topic_listener_auth" {
  name     = "listener"
  topic_id = azurerm_servicebus_topic.topic_users.id

  listen = true
  send   = false
  manage = false
}

####################
# Orders topic
####################

resource "azurerm_servicebus_topic" "topic_orders" {
  name         = "orders-topic"
  namespace_id = azurerm_servicebus_namespace.sb.id

  partitioning_enabled = true
}

resource "azurerm_servicebus_subscription" "orders_topic_users_subscription" {
  name               = "orders-topic-users-subscription"
  topic_id           = azurerm_servicebus_topic.topic_orders.id
  max_delivery_count = 1
}

resource "azurerm_servicebus_topic_authorization_rule" "orders_topic_sender_auth" {
  name     = "sender"
  topic_id = azurerm_servicebus_topic.topic_orders.id

  listen = false
  send   = true
  manage = false
}

resource "azurerm_servicebus_topic_authorization_rule" "orders_topic_listener_auth" {
  name     = "listener"
  topic_id = azurerm_servicebus_topic.topic_orders.id

  listen = true
  send   = false
  manage = false
}