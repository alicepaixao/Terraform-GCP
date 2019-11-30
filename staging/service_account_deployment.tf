resource "google_service_account" "deployment_service_account" {
  account_id   = "content-deployment-gke"
  display_name = "Service Account For Kubernetes deployment"
}

resource "google_project_iam_member" "deployment_service_account_iam" {
  count   = "${length(var.deployment_service_account_roles)}"
  project = "${var.project_id}"
  role    = "${element(var.deployment_service_account_roles, count.index)}"
  member  = "serviceAccount:${google_service_account.deployment_service_account.email}"
}
