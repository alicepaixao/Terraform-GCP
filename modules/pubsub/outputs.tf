output "topic" {
  value       = "${google_pubsub_topic.topic.name}"
  description = "The name of the Pub/Sub topic"
}

output "id" {
  value       = "${google_pubsub_topic.topic.id}"
  description = "The ID of the Pub/Sub topic"
}

output "uri" {
  value       = "pubsub.googleapis.com/${google_pubsub_topic.topic.id}"
  description = "The URI of the Pub/Sub topic"
}

output "subscription_names" {
  value = "${concat(
    google_pubsub_subscription.push_subscriptions.*.name,
    google_pubsub_subscription.pull_subscriptions.*.name
  )}"

  description = "The name list of Pub/Sub subscriptions"
}

output "subscription_paths" {
  value = "${concat(
    google_pubsub_subscription.push_subscriptions.*.path,
    google_pubsub_subscription.pull_subscriptions.*.path
  )}"

  description = "The path list of Pub/Sub subscriptions"
}
