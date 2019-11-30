resource "kubernetes_namespace" "namespace_name" {
  count = "${length(var.gke_namespaces)}"

  metadata {
    annotations {
      name = "${element(var.gke_namespaces, count.index)}"
    }

    labels {
      project         = "${var.project_name}"
      istio-injection = "enabled"
    }

    name = "${element(var.gke_namespaces, count.index)}"
  }

  depends_on = ["google_container_node_pool.gke_cluster-nodepool"]
}
