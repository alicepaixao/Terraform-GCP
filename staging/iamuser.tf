
resource "google_project_iam_member" "stack_dashboard_creator" {
  project    = "${var.project_id}"
  role       = "roles/monitoring.editor"
  count      = "${length(var.stack_dashboard_create_users)}"
  member     = "${element(var.stack_dashboard_create_users, count.index)}"
  depends_on = ["google_project_service.project_services"]
}

resource "google_project_iam_member" "log_based_dashboard_creator" {
  project    = "${var.project_id}"
  role       = "roles/logging.configWriter"
  count      = "${length(var.stack_dashboard_create_users)}"
  member     = "${element(var.stack_dashboard_create_users, count.index)}"
  depends_on = ["google_project_service.project_services"]
}

resource "google_project_iam_member" "monitoring_admin" {
  project    = "${var.project_id}"
  role       = "roles/monitoring.admin"
  count      = "${length(var.iam_monitoring_admin)}"
  member     = "${element(var.iam_monitoring_admin, count.index)}"
  depends_on = ["google_project_service.project_services"]
}


resource "google_project_iam_member" "viewer" {
  project    = "${var.project_id}"
  role       = "roles/viewer"
  count      = "${length(var.iam_viewer_users)}"
  member     = "${element(var.iam_viewer_users, count.index)}"
  depends_on = ["google_project_service.project_services"]
}

