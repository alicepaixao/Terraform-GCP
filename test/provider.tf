provider "google" {
  version                 = "2.9.0"
  project                 = "${var.project_id}"
  region                  = "${var.region}"
}

provider "google-beta" {
  version                 = "2.9.0"
  project                 = "${var.project_id}"
  region                  = "${var.region}"
}

provider "kubernetes" {
  version                = "1.7.0"
  load_config_file       = false
  host                   = "${module.gke.gke_cluster_endpoint}"
  token                  = "${module.gke.google_client_config_access_token}"
  cluster_ca_certificate = "${base64decode(module.gke.gke_cluster_cluster_ca_certificate)}"
}

provider "helm" {
  install_tiller = false

  kubernetes {
    host                   = "${module.gke.gke_cluster_endpoint}"
    token                  = "${module.gke.google_client_config_access_token}"
    cluster_ca_certificate = "${base64decode(module.gke.gke_cluster_cluster_ca_certificate)}"
  }
}
