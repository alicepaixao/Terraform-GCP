resource "google_pubsub_topic" "topic" {
  name    = "${var.topic}"
  project = "${var.project_id}"
}

resource "google_pubsub_subscription" "push_subscriptions" {
  count                = "${length(var.push_subscriptions)}"
  name                 = "${lookup(var.push_subscriptions[count.index], "name")}"
  topic                = "${google_pubsub_topic.topic.name}"
  project              = "${var.project_id}"
  ack_deadline_seconds = "${lookup(var.push_subscriptions[count.index], "ack_deadline_seconds", 10)}"

  push_config {
    push_endpoint = "${lookup(var.push_subscriptions[count.index], "push_endpoint")}"
  }

  depends_on = ["google_pubsub_topic.topic"]
}

resource "google_pubsub_subscription" "pull_subscriptions" {
  count                = "${length(var.pull_subscriptions)}"
  name                 = "${lookup(var.pull_subscriptions[count.index], "name")}"
  topic                = "${google_pubsub_topic.topic.name}"
  project              = "${var.project_id}"
  ack_deadline_seconds = "${lookup(var.pull_subscriptions[count.index], "ack_deadline_seconds", 10)}"

  depends_on = ["google_pubsub_topic.topic"]
}

