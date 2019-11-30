resource "google_service_account" "deployment_service_account" {
  account_id   = "content-deployment-gke"
  display_name = "Service Account For Kubernetes deployment"
}

# resource "google_project_iam_member" "deployment_service_account_iam" {
#   count   = "${length(var.deployment_service_account_roles)}"
#   project = "${var.project_id}"
#   role    = "${element(var.deployment_service_account_roles, count.index)}"
#   member  = "serviceAccount:${google_service_account.deployment_service_account.email}"
# }

# // Create just only one service account for each microservice
# resource "google_service_account" "product-types-service_sa" {
#     account_id   = "product-types-${var.environment}"
#     display_name = "Service Account For Publish Product Types Topics"
# }

# resource "google_service_account" "channel-service_sa" {
#     account_id   = "channels-${var.environment}"
#     display_name = "Service Account For Publish Channels Topics"
# }

# resource "google_service_account" "company-service_sa" {
#     account_id   = "company-${var.environment}"
#     display_name = "Service Account For Publish Company Topics"
# }

# // IAM Role to publish messages from product type service to product-types-created-topic using same JSON (Helm ENV) from service account line 14
# resource "google_pubsub_topic_iam_member" "product-types-created_sa" {
#   topic      = "${module.product-types-created-topic.topic}"
#   role       = "roles/pubsub.publisher"
#   member     = "serviceAccount:${google_service_account.product-types-service_sa.email}"
#   depends_on = ["module.product-types-created-topic"]
# }

# // IAM Role to publish messages from product type service to product-types-updated-topic using same JSON (Helm ENV) from service account line 14
# resource "google_pubsub_topic_iam_member" "product-types-updated_sa" {
#   topic      = "${module.product-types-updated-topic.topic}"
#   role       = "roles/pubsub.publisher"
#   member     = "serviceAccount:${google_service_account.product-types-service_sa.email}"
#   depends_on = ["module.product-types-updated-topic"]
# }

# resource "google_pubsub_topic_iam_member" "channels-updated_sa" {
#   topic      = "${module.channels-updated-topic.topic}"
#   role       = "roles/pubsub.publisher"
#   member     = "serviceAccount:${google_service_account.channel-service_sa.email}"
#   depends_on = ["module.channels-updated-topic"]
# }

# resource "google_pubsub_topic_iam_member" "company-updated_sa" {
#   topic      = "${module.company-updated-topic.topic}"
#   role       = "roles/pubsub.publisher"
#   member     = "serviceAccount:${google_service_account.company-service_sa.email}"
#   depends_on = ["module.company-updated-topic"]
# }