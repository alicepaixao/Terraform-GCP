resource "google_project_service" "project_services" {
  project                    = "${var.project_id}"
  count                      = "${length(var.google_service_apis)}"
  service                    = "${element(var.google_service_apis, count.index)}"
  disable_dependent_services = true
  disable_on_destroy         = true

  provisioner "local-exec" {
    command = "sleep 30"
  }
}