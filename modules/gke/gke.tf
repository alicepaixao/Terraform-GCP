## Private & Regional Cluster
resource "google_container_cluster" "gke_cluster" {
  name               = "${var.project_name}-cluster"
  location           = "${var.region}"
  node_version       = "${var.gke_version}"
  min_master_version = "${var.gke_version}"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  logging_service    = "logging.googleapis.com/kubernetes"
  network            = "${var.network}"
  subnetwork         = "${var.subnetwork}"
  provider           = "google-beta"
  initial_node_count = "${var.initial_node_count}"

  private_cluster_config {
    enable_private_nodes   = true
    master_ipv4_cidr_block = "${var.master_ipv4_cidr_block}"
  }

  ip_allocation_policy {
    services_ipv4_cidr_block = "${var.services_ipv4_cidr_block}"
  }

  resource_labels = {
    project     = "${var.project_name}"
    environment = "${var.environment}"
  }

  addons_config {
    http_load_balancing {
      disabled = true
    }

    kubernetes_dashboard {
      disabled = false
    }

    istio_config {
      disabled = false
    }
  }

  # Support to encrypt the etcd data in GKE cluster
  database_encryption {
    state    = "${var.gke_encryption_state}"
    key_name = "${var.gke_encryption_key}"
  }

  master_authorized_networks_config {
    cidr_blocks = [
      {
        cidr_block = "0.0.0.0/0"

        display_name = "Disabled"
      },
    ]
  }

  lifecycle {
    ignore_changes = ["node_version", "resource_labels"]
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.daily_maintenance_window_start}"
    }
  }

  remove_default_node_pool = true

}

resource "google_container_node_pool" "gke_cluster-nodepool" {
  name       = "${var.project_name}-node-pool"
  location   = "${var.region}"
  cluster    = "${google_container_cluster.gke_cluster.name}"
  node_count = 1
  provider   = "google-beta"

  node_config {
    oauth_scopes = ["${var.oauth_scopes}"]

    disk_size_gb = "${var.node_pool_disk_size}"

    preemptible  = "${var.gke_preemptible}"
    machine_type = "${var.gke_instance_type}"

    labels {
      project     = "${var.project_name}"
      environment = "${var.environment}"

      #  tenant      = "global"
    }

    tags = ["${var.environment}"]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = "${var.gke_auto_min_count}"
    max_node_count = "${var.gke_auto_max_count}"
  }

  lifecycle {
    ignore_changes = ["node_count", "node_config.0.labels"]
  }
}

data "google_client_config" "default" {}