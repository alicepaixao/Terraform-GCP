variable "project_id" {
  description = "The project ID to manage the Pub/Sub resources"
}

variable "topic" {
  description = "The Pub/Sub topic name"
}

variable "push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}
