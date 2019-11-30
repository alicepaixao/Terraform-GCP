# module "gke" {
#   source             = "../modules/gke"
#   environment        = "${var.environment}"
#   project_name       = "${var.project_name}"
#   region             = "${var.region}"
#   network            = "${google_compute_network.project_network.self_link}"
#   subnetwork         = "${google_compute_subnetwork.project_network.self_link}"
#   gke_version        = "${var.gke_version}"
#   gke_instance_type  = "${var.gke_instance_type}"
#   gke_namespaces     = "${var.gke_namespaces}"
#   gke_auto_min_count = "${var.gke_auto_min_count}"
#   gke_auto_max_count = "${var.gke_auto_max_count}"
#   gke_preemptible    = "${var.gke_preemptible}"

#   initial_node_count             = "${var.initial_node_count}"
#   node_pool_disk_size            = "${var.node_pool_disk_size}"
#   oauth_scopes                   = "${var.oauth_scopes}"
#   daily_maintenance_window_start = "${var.daily_maintenance_window_start}"
#   master_ipv4_cidr_block        = "${var.master_ipv4_cidr_block}"

#   subnet_ip_cidr_range = "${var.subnet_ip_cidr_range}"
#   services_ipv4_cidr_block = "${var.services_ipv4_cidr_block}"

#   tiller_net_host        = "${var.tiller_net_host}"
#   tiller_replicas        = "${var.tiller_replicas}"
#   tiller_version         = "${var.tiller_version}"
#   tiller_namespace       = "${var.tiller_namespace}"
#   tiller_node_selector   = "${var.tiller_node_selector}"
#   tiller_image           = "${var.tiller_image}"
#   tiller_service_account = "${var.tiller_service_account}"
#   tiller_max_history     = "${var.tiller_max_history}"

#   gke_encryption_state = "${var.gke_encryption_state}"
#   gke_encryption_key   = "${var.gke_encryption_key}"
# }

# # Getting Kubernetes Ingress IP
# data "kubernetes_service" "istio_ingress" {
#   metadata {
#     name      = "istio-ingressgateway"
#     namespace = "istio-system"
#   }

#   depends_on = ["module.gke"]
# }