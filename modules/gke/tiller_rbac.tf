resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = "tiller"
    namespace = "${var.tiller_namespace}"
  }
  automount_service_account_token = "true"

  depends_on = ["google_container_node_pool.gke_cluster-nodepool"]
}

resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "${var.tiller_service_account}"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "${kubernetes_service_account.tiller.metadata.0.name}"
    namespace = "${var.tiller_namespace}"

    # See https://github.com/terraform-providers/terraform-provider-kubernetes/issues/204
    api_group = ""
  }

  depends_on = ["google_container_node_pool.gke_cluster-nodepool"]
}

resource "kubernetes_deployment" "tiller_with_rbac" {
  metadata {
    name      = "tiller-deploy"
    namespace = "${var.tiller_namespace}"

    labels {
      app  = "helm"
      name = "tiller"
    }
  }

  spec {
    replicas = "${var.tiller_replicas}"

    selector {
      match_labels {
        app  = "helm"
        name = "tiller"
      }
    }

    template {
      metadata {
        labels {
          app  = "helm"
          name = "tiller"
        }
      }

      spec {
        service_account_name = "${kubernetes_service_account.tiller.metadata.0.name}"

        container {
          name              = "tiller"
          image             = "${var.tiller_image}:${var.tiller_version}"
          image_pull_policy = "IfNotPresent"

          port {
            name           = "tiller"
            container_port = 44134
          }

          port {
            name           = "http"
            container_port = 44135
          }

          env {
            name  = "TILLER_NAMESPACE"
            value = "${var.tiller_namespace}"
          }

          env {
            name  = "TILLER_HISTORY_MAX"
            value = "${var.tiller_max_history}"
          }

          liveness_probe {
            http_get {
              path = "/liveness"
              port = 44135
            }

            initial_delay_seconds = 1
            timeout_seconds       = 1
          }

          readiness_probe {
            http_get {
              path = "/readiness"
              port = 44135
            }

            initial_delay_seconds = 1
            timeout_seconds       = 1
          }
        }

        host_network  = "${var.tiller_net_host}"
        node_selector = "${var.tiller_node_selector}"

      }
    }
  }

  depends_on = ["google_container_node_pool.gke_cluster-nodepool"]
}
